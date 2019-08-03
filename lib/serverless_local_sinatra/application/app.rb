require 'sinatra'
require 'yaml'

class ServerlessLocalSinatraApp < Sinatra::Base
  set :port, ENV.fetch("SERVERLESS_SINATRA_PORT", 9494)

  def self.get_or_post(path, opts={}, &block)
    get(path, opts, &block)
    post(path, opts, &block)
  end

  YAML.load(File.read('serverless.yml'))["functions"].each_pair do |name, handler|
    get_or_post "/#{name}" do
      request.body.rewind
      body = request.body.read
      sanitized_body = body.gsub("'", "")
      command = "serverless invoke local -f #{name}"
      command += " -d '#{sanitized_body}'" unless sanitized_body.empty?
      puts command
      `#{command}`
    end
  end
end

ServerlessLocalSinatraApp.run!
