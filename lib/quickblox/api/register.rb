#
# Usage:
#
#   Register.user(
#     {
#       login:        'username',
#       password:     'string',
#       phone:        'string',
#       full_name:    'string',
#       email:        'string',
#       website:      'string',
#       facebook_id:  'string',
#       twitter_id:   'string',
#       blob_id:      'string',
#       custom_data:  'string',
#       user_tags:    'string',
#       user_id:      'string/integer',
#       platform:     'android',
#       udid:         'someudid',
#     }
#   )
#
#
module Quickblox
  module Api
    module Register
      extend self
      extend ResponseHelper

      def user(options)
        connection  = Connection.open_session
        response    = connection.post('/users.json', options)
        connection.close_session
        parse(response, type: 'register')
      end


    end
  end
end
