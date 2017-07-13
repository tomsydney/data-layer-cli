require 'rest_client'
require 'uri'
require 'json'

module EdlCli
  class Client

    def initialize(config)
      @config = config
      @uri = URI.parse(@config.url)
      @token = new_auth0_token
    end

    def authenticated?
      @token.empty?
    end

    def request(action, path, payload = {})
      case action
      when :get
        get(path)
      when :post
        post(path, payload)
      else
        raise "unsupported http action"
      end
    end

    private

    def headers(content_type = :json)
      {
        Authorization: @token,
        content_type: content_type
      }
    end

    def get(path)
      # note that merge will also merge two full URIs
      # e.g. https://foo.com/.merge(http://foo.net/path) => http://foo.net/path
      RestClient.get(@uri.merge(path).to_s, headers)
    end

    def post(path, payload)
      puts "WORK IN PROGRESS"
    end

    def new_auth0_token
      auth0_endpoint = 'https://eaglegenomics.eu.auth0.com/oauth/token'
      payload = {
        client_id: @config.id,
        client_secret: @config.secret,
        audience: @config.url,
        grant_type: 'client_credentials'
      }.to_json
      head = {
        content_type: :json,
        accept: :json
      }
      begin
        response = RestClient.post(auth0_endpoint, payload, head)
        if response.code == 200
          body = JSON.parse(response.body)
          return [body["token_type"], body["access_token"]].join(' ')
        end
      rescue RestClient::Unauthorized => e
        puts e.message
      end
    end
  end
end
