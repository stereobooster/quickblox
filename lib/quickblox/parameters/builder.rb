module Quickblox
  module Parameters
    class Builder

      def self.build!(options)
        new(options).build!
      end

      def initialize(options)
        @options = options
      end

      def build!
        sorted_params = sort_params( @options )
        encode_params( sorted_params )
      end

      def sort_params(param_hash)
        Sorter.sort!(param_hash)
      end

      def encode_params(sorted_params_hash)
        Encoder.encode!(sorted_params_hash)
      end

    end
  end
end
