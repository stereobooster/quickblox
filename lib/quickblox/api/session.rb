
module Quickblox
  module Api
    class Session
      attr_reader :token, :_id, :application_id, :created_at, :device_id, :nonce, :ts,
                  :updated_at, :user_id

      def initialize(sess)
        sess.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end


      def self.close(token)
        Connection.connect.delete do |request|
          request.url "/session.json"
          request.headers['QB-Token'] = token
        end
      end

      def close
        Connection.connect.delete do |request|
          request.url "/session.json"
          request.headers['QB-Token'] = token
        end
      end

    end
  end
end
