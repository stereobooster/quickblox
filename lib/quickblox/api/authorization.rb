
module Quickblox
  module Api
    module Authorization
      extend self
      extend ::Quickblox::Api::RequestHelper

      def authorize(options = {})
        data = normalize(options)

        Connection.connect.post do |request|
          request.url   '/auth.json'
          request.body  = "#{data}&signature=#{signature(data)}"
        end
      end

    end
  end
end
