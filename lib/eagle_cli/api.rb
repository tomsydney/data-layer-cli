module EagleCli
  module Api
    class DataLayer

      def initialize(client)
        @base = '/data-layer/v1'
        @client = client
      end

      # Currently unavaiable
      #def raml
      #  call(:get, '/raml')
      #end

      def list
        call(:get, '/data-packages')
      end

      def download(package_url)
        # we expect to have the fully qualified URL here.
        # TODO: also allow for just UUID
        @client.request(:get, package_url)
      end

      def upload(package, format)
        case format
        when '.zip'
          content_type = 'application/abc'
          payload = File.open(package, 'r')
        when '.json'
          content_type = :json
          payload = File.read(package)
        else
          raise 'invalid file format'
        end
        @client.request(:post, "#{@base}/data-packages", payload, content_type)
      end

      private

      def call(action, path, payload = {})
        path = @base + path
        JSON.parse(
          @client.request(action, path, payload)
        )
      end
    end
  end
end
