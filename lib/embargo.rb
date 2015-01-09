require 'cuba'
require 'cuba/render'
require 'tilt/haml'
require 'haml'
require "rack/protection"

Cuba.settings[:render] = {
	template_engine: "haml",
	views: "./app/views"
}

Cuba.plugin(Cuba::Render)
Cuba.use Rack::Session::Cookie, :secret => "__a_very_long_string__"
Cuba.use Rack::Protection

Dir[__FILE__+"/lib/helpers/*.rb"].each {|file| require file }

class Embargo < Cuba
  def content_for(key, &block)
    if block
      @_content_for ||= {}
      buf_was = @haml_buffer.buffer
      @haml_buffer.buffer = ''
      yield
      @_content_for[key] = @haml_buffer.buffer
      @haml_buffer.buffer = buf_was
    elsif @_content_for
      @_content_for[key]
    end
  end

  def self.app_directory
    @@app_directory ||= Dir.pwd
  end

  def self.require_file(file_name)
    project_file_name = Embargo.app_directory + "/" + file_name
    project_file_exists = File.exist?(project_file_name)

    if project_file_exists
      require project_file_name
    else
      embargo_file_name = Embargo.directory + "/" + file_name
      embargo_file_exists = File.exist?(embargo_file_name)
      if embargo_file_exists
        require embargo_file_name
      end
    end
  end
end

Embargo.require_file("config/app.rb")
Dir[Embargo.app_directory+"/lib/*.rb"].each {|file| require file }
Dir[Embargo.app_directory+"/config/initializers/*.rb"].each {|file| require file }
Dir[Embargo.app_directory+"/app/models/*.rb"].each {|file| require file }
Dir[Embargo.app_directory+"/app/serializers/*.rb"].each {|file| require file }
Dir[Embargo.app_directory+"/app/controllers/*_controller.rb"].each {|file| require file }
Dir[Embargo.app_directory+"/app/controllers/**/*_controller.rb"].each {|file| require file }

Embargo.define do
  on default do
    run ApplicationController
  end
end