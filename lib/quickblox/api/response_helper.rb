
module Quickblox
  module Api
    module ResponseHelper

      def parse(response, type:)
        json = ::JSON.parse(response.body)

        if response.success?
          json
        else
          handle_error(json, type)
        end
      end


      def handle_error(parsed_response, type)
        ::Quickblox::Api::Error.new(parsed_response, type)
      end

    end
  end
end
