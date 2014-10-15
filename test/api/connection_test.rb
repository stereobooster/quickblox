require 'test_helper'

module Quickblox
  module Api
    class ConnectionTest < Minitest::Test
      include Quickblox::TestHelper::Credentials

      def setup
        ::Quickblox.config = config_for(:quickblox)
      end

      def test_initialization
        connection = Connection.new
        assert connection.connect
      end

      def test_open_and_close_session
        sess = Connection.open_session

        refute_nil sess.session

        assert sess.close_session
        assert_nil sess.session
      end

    end
  end
end
