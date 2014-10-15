require 'test_helper'

module Quickblox
  module Parameters
    class SorterTest < Minitest::Test

      def test_order
        hash = {
          timestamp:      123,
          auth_key:       'abc123',
          user: {
            owner_id: 1,
            password: 'me',
            login:    'you',
          },
          nonce:          111,
          application_id: 1,
        }

        expected = {
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

        ordered = Sorter.sort!( hash )

        assert_equal expected.keys, ordered.keys
        refute_equal hash.keys,     ordered.keys

        assert_equal expected[:user].keys, ordered[:user].keys
      end

    end
  end
end
