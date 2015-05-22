module Quickblox
  class Config
    attr_reader :application_id, :auth_key, :auth_secret, :server,
                :user_owner_id, :login, :password, :platform, :udid,
                :user_owner_login, :user_owner_password

    def self.setup(options)
      new(options)
    end

    def initialize(options)
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def logger
      @logger || :logger
    end

    def request_type
      @request_type || :url_encoded
    end

    def adapter
      @adapter || :net_http
    end
  end

end
