require 'cuba'
require 'cuba/render'

if ENV['RACK_ENV'] == "development"
  require_relative "environments/development.rb"
end

Encoding.default_external = "UTF-8"

Cuba.use Rack::Deflater
Cuba.use Rack::Static, root: "public", urls: ["/css","/js","/img"]

Cuba.plugin(Cuba::Render)

Cuba.settings[:render][:template_engine] = "haml"

config_file = "/etc/traitify/selfservice-config.rb"
if File.exists?(config_file)
  require_relative config_file
else
  require_relative 'local_variables.rb'
end

require_relative 'traitify.rb'