
module Quickblox
  class ParameterBuilding
    attr_reader :parameters

    def self.build!(options = {})
      new.build!(options)
    end

    def initialize
      @parameters = base_parameters
    end

    def build!(options = {})
      parameters.merge!(
        user: {
          owner_id:         ::Quickblox.config.user_owner_id,
          login:            ( options.fetch('login', nil)     || ::Quickblox.config.user_owner_login ),
          password:         ( options.fetch('password', nil)  || ::Quickblox.config.user_owner_password ),
          phone:            options.fetch('phone', nil),
          full_name:        options.fetch('full_name', nil),
          email:            options.fetch('email', nil),
          website:          options.fetch('website', nil),
          facebook_id:      options.fetch('facebook_id', nil),
          twitter_id:       options.fetch('twitter_id', nil),
          blob_id:          options.fetch('blob_id', nil),
          custom_data:      options.fetch('custom_data', nil),
          user_tags:        options.fetch('user_tags', nil),
          external_user_id: options.fetch('user_id', nil),
        },
        device: {
          platform:         options.fetch('platform', nil),
          udid:             options.fetch('udid', nil),
        }
      )
    end

    private

    def base_parameters
      {
        application_id: ::Quickblox.config.application_id,
        auth_key:       ::Quickblox.config.auth_key,
        nonce:          rand(10000),
        timestamp:      ::Time.now.utc.to_i,
        device:         {},
        user:           {},
      }
    end

  end

end
