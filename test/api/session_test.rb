require 'test_helper'

module Quickblox
  module Api
    class SessionTest < Minitest::Test
      include Quickblox::TestHelper::Credentials

      def sess
        {
          '_id'               => '123',
          'application_id'    => 1,
          'created_at'        => Time.now.to_s,
          'updated_at'        => Time.now.to_s,
          'device_id'         => 'abc',
          'nonce'             => 3234,
          'token'             => 'abc123',
          'ts'                => 'ts',
          'user_id'           => 1,
        }
      end

      def test_session_storage
        session = Session.new(sess)

        assert_equal sess['_id'],             session._id
        assert_equal sess['application_id'],  session.application_id
        assert_equal sess['created_at'],      session.created_at
        assert_equal sess['updated_at'],      session.updated_at
        assert_equal sess['device_id'],       session.device_id
        assert_equal sess['nonce'],           session.nonce
        assert_equal sess['token'],           session.token
        assert_equal sess['ts'],              session.ts
        assert_equal sess['user_id'],         session.user_id
      end


      def test_closing_session
        ::Quickblox.config = config_for(:quickblox)
        response  = Authorization.authorize
        sess      = ::JSON.parse(response.body)['session']


        session = Session.new(sess)
        refute_nil session.user_id
        refute_nil session.token

        assert session.close.success?
      end

    end
  end
end

