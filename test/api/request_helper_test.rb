require 'test_helper'

module Quickblox
  module Api
    class RequestHelperTest < Minitest::Test

      def setup
        ::Quickblox.config = options
      end

      def build_params
        {
          login:        'dude',
          password:     '123456',
          platform:     'android',
          udid:         'abc123',
        }
      end

      def options
        {
          application_id:   13,
          auth_key:         'abc123',
          auth_secret:      'secret',
          server:           'someserver.com',
          user_owner_id:    1,
        }
      end

      def test_parameter_building
        built = ::Quickblox::Api::RequestHelper::ParameterBuilding.build!(build_params)
        assert_equal 'dude',    built.fetch(:user).fetch(:login)
        assert_equal '123456',  built.fetch(:user).fetch(:password)
        assert_equal 1,         built.fetch(:user).fetch(:owner_id)
        assert_equal 'android', built.fetch(:device).fetch(:platform)
        assert_equal 'abc123',  built.fetch(:device).fetch(:udid)
        assert_equal 13,        built.fetch(:application_id)
        assert_equal 'abc123',  built.fetch(:auth_key)
      end

      def test_normalize
        klass = Class.new { include Quickblox::Api::RequestHelper }.new
        parameters = klass.normalize(build_params)


        assert parameters
        assert klass.signature(parameters)
      end

    end
  end
end
