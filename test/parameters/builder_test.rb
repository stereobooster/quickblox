require 'test_helper'

module Quickblox
  module Parameters
    class BuilderTest < Minitest::Test
      include TestHelper

      def setup
        ::Quickblox.config = options
      end

      def build_params
        {
          application_id:   1,
          auth_key:         '123',
          nonce:            3234,
          timestamp:        'stamp',
          user: {
            login:        'dude',
            password:     '123456',
          },

          device: {
            platform:     'android',
            udid:         'abc123',
          },
        }
      end

      def test_builder
        build = ::Quickblox::Parameters::Builder.build!(build_params)
        expected = "application_id=1&auth_key=123&device[platform]=android&device[udid]=abc123&nonce=3234&timestamp=stamp&user[login]=dude&user[password]=123456"

        assert_equal expected, build
      end
    end

  end
end
