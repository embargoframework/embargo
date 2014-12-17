require 'cuba'
require 'cuba/render'
require 'tilt/haml'
require 'haml'

Cuba.settings[:render] = {
	template_engine: "haml",
	views: "./app/views"
}

Cuba.plugin(Cuba::Render)

class Embargo
	def self.application
		Cuba
	end
	
	def self.app_directory
		@@magis_working_directory ||= Dir.pwd
	end

	def self.directory
		@@magis_directory ||= __FILE__
	end

	def self.require_file(file_name)
		project_file_name = Embargo.app_directory + "/" + file_name
		project_file_exists = File.exist?(project_file_name)

		magis_file_name = Embargo.directory + "/" + file_name
		magis_file_exists = File.exist?(magis_file_name)
		
		if project_file_exists
			require home_file_name
		elsif magis_file_exists
			require magis_file_name
		end
	end
end

class Cuba
  module Render
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
  end
end
Dir[Embargo.app_directory+"/lib/*.rb"].each {|file| require file }
Dir[Embargo.app_directory+"/config/initializers/*.rb"].each {|file| require file }
Dir[Embargo.app_directory+"/app/models/*.rb"].each {|file| require file }
Dir[Embargo.app_directory+"/app/controllers/*_controller.rb"].each {|file| require file }