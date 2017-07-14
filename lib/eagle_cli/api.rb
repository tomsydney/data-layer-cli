module EagleCli
  class Api

    def initialize(client)
      @client = client
    end

    def raml
      call(:get, '/raml')
    end

    def list
      call(:get, '/data-packages')
    end

    def download(package_url)
      # we expect to have the fully qualified URL here.
      @client.request(:get, package_url)
    end

    def upload(package, format)
      case format
      when '.zip'
        content_type = 'application/zip'
        payload = File.open(package, 'r')
      when '.json'
        content_type = :json
        payload = File.read(package)
      else
        raise 'invalid file format'
      end
      @client.request(:post, '/data-packages', payload, content_type)
    end

    private

    def call(action, path, payload = {})
      JSON.parse(
        @client.request(action, path, payload)
      )
    end
  end
end
