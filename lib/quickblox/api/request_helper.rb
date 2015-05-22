module Quickblox
  module Api
    module RequestHelper

      def signature(data)
        Signer.sign!(data)
      end

      def normalize(options = {})
        ::Quickblox::Parameters::Builder.build!(
          ::Quickblox::ParameterBuilding.build!(options)
        )
      end

    end
  end
end
