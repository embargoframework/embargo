if ENV['RACK_ENV']
  Embargo.require_file("environments/#{ENV['RACK_ENV']}.rb")
end

Encoding.default_external = "UTF-8"

Cuba.use Rack::Deflater
Cuba.use Rack::Static, root: "public", urls: ["/css","/js","/img"]

Cuba.plugin(Cuba::Render)

Cuba.settings[:render][:template_engine] = "haml"