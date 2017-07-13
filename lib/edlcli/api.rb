module EdlCli
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
      @client.request(:get, package_url)
    end

    def upload(package)
      if !File.exist?(package)
        puts "File #{package} could not be found"
      else
        case File.extname(package)
        when '.zip'
          upload_zip(package)
        when '.json'
          upload_json(package)
        else
          puts "Only .zip and .json are valid formats"
        end
      end
    end

    private

    def upload_zip(package)
      raise "work in progress"
    end

    def upload_json(package)
      raise "work in progresss"
    end

    def call(action, path, payload = {})
      JSON.parse(
        @client.request(action, path, payload)
      )
    end
  end
end
