require 'swagger_yard'

SwaggerYard.register_custom_yard_tags!

spec = SwaggerYard::OpenAPI.new

SwaggerYard.configure do |config|
  config.openapi_version = "3.0"

  config.title = 'Your API'
  config.description = 'Your API does this'

  # where your actual api is hosted from
  config.api_base_path = "http://localhost:3000/api"

  # Where to find controllers (can be an array of paths/globs)
  # config.controller_path = 'app.rb'
  config.controller_path = 'specs/*_spec.rb'
end

spec = SwaggerYard::OpenAPI.new
File.open("openapi.json", "w") { |f| f << JSON.pretty_generate(spec.to_h) }
