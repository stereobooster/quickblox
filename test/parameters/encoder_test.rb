require 'test_helper'

module Quickblox
  module Parameters
    class EncoderTest < Minitest::Test
      def test_encode
        options = {
          application_id: 1,
          auth_key:       'abc123',
          nonce:          111,
          timestamp:      123,
          user: {
            login:    'you',
            owner_id: 1,
            password: 'me',
          },
        }

        expected = "application_id=1&auth_key=abc123&nonce=111&timestamp=123&user[login]=you&user[owner_id]=1&user[password]=me"

        assert_equal expected, Encoder.new(options).encode!
        assert_equal expected, Encoder.encode!(options)
      end
    end
  end
end
