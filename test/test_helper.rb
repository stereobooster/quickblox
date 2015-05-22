require 'minitest/autorun'
require 'minitest/pride'
require 'yaml'
require 'pathname'
require 'ostruct'

require_relative '../lib/quickblox'

module Quickblox
  module TestHelper
    module Credentials
      def config_file
        Pathname.new(__dir__).join("assets/quickblox.yml")
      end

      def config_for(name)
        OpenStruct.new YAML.load(config_file.read)[name.to_s]
      end
    end

    def options
      OpenStruct.new(
        application_id:       13,
        auth_key:             'abc123',
        auth_secret:          'secret',
        server:               'someserver.com',
        user_owner_id:        1,
        user_owner_login:     'me',
        user_owner_password:  'pass',
      )
    end


    def user
      {
        'owner_id' => 1,
        'password' => 'me',
        'login'    => 'you',
      }
    end


    def device
      {
        'platform' => 'android',
        'udid'     => '123',
      }
    end


    def assert_options_for(config)
      assert_equal 13,                config.application_id
      assert_equal 'abc123',          config.auth_key
      assert_equal 'secret',          config.auth_secret
      assert_equal 'someserver.com',  config.server
      assert_equal 1,                 config.user_owner_id
      assert_equal 'me',              config.user_owner_login
      assert_equal 'pass',            config.user_owner_password
    end
  end
end
