
module Quickblox
  module Api
    class Error
      attr_reader :errors, :type

      def initialize(parsed_response, type)
        @errors = parsed_response["errors"]
        @type   = type
      end

    end
  end
end
