require 'helper'

module EdlCli
  describe Client do
    config = Config.with({name: "foo", url: "A", id: "B", secret: "C"})
    headers = { content_type: :json, accept: :json}
    # this smells, abstract to config
    endpoint = 'https://eaglegenomics.eu.auth0.com/oauth/token'
    payload = {
      client_id: config.id,
      client_secret: config.secret,
      audience: config.url,
      grant_type: 'client_credentials'
    }.to_json

    describe ".new" do
      context "with valid credentials" do
        it "takes a valid config and retrieves a token from auth0" do
          response = instance_double(
            "Response",
            code: 200,
            body: "{\"access_token\":\"foo\",\"token_type\":\"Bearer\"}"
          )
          expect(RestClient).to receive(:post).with(endpoint, payload, headers).and_return(response)
          client = Client.new(config)
          expect(client.instance_variable_get(:@token)).to eq('Bearer foo')
        end
      end
      context "with invalid credentials" do
        it "retuns a non authenticated client" do
          expect(RestClient).to receive(:post).with(endpoint, payload, headers)
            .and_raise(RestClient::Unauthorized)
          client = Client.new(config)
          expect(client.instance_variable_get(:@token)).to eq(nil)
        end
      end
    end

    describe ".request" do
      xit ""
      context "GET action" do
        xit "calls the get action" do

        end
      end
      context "POST action" do
        xit "calls the get action" do

        end
      end
    end
  end
end
