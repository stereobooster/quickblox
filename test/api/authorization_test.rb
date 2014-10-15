require 'test_helper'

module Quickblox
  module Api
    class AuthorizationTest < Minitest::Test
      include Quickblox::TestHelper::Credentials

      def setup
        ::Quickblox.config = config_for(:quickblox)
      end

      def test_options
        response  = Authorization.authorize
        session   = response.body

        assert_equal 201, response.status
        # assert_equal '', response.headers
        # assert_equal '', response.body
        # assert_equal '', response

        refute_nil session['_id']
        refute_nil session['application_id']
        refute_nil session['created_at']
        refute_nil session['device_id']
        refute_nil session['nonce']
        refute_nil session['token']
        refute_nil session['ts']
        refute_nil session['updated_at']
        refute_nil session['user_id']

        assert Session.close(session['token'])
      end

    end
  end
end
