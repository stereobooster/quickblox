require 'test_helper'

module Quickblox
  module Api
    class RegisterTest < Minitest::Test
      include Quickblox::TestHelper::Credentials

      def setup
        ::Quickblox.config = config_for(:quickblox)
      end


      def test_registering_new_user
        response = Register.user({
          'login'     => 'devise@rubyonrails.com',
          'password'  => '12345678',
          'platform'  => 'android',
          'udid'      => '1234abc',
        })

        assert response
      end

    end
  end
end

## Success
#
# {"user"=>{"id"=>1697205, "owner_id"=>19257, "full_name"=>nil, "email"=>nil, "login"=>"ruby@test.com", "phone"=>nil, "website"=>nil, "created_at"=>"2014-10-14T22:15:29Z", "updated_at"=>"2014-10-14T22:15:29Z", "last_request_at"=>nil, "external_user_id"=>nil, "facebook_id"=>nil, "twitter_id"=>nil, "blob_id"=>nil, "custom_data"=>nil, "user_tags"=>nil}}
#
#
## ERROR
#
# {"errors"=>{"login"=>["has already been taken"]}}
# {"errors"=>{"password"=>["is too short (minimum is 8 characters)"]}}
# {"errors"=>{"password"=>["is too short (minimum is 8 characters)"], "base"=>["Login or email required"]}}
#
