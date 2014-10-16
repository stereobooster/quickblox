
module Quickblox
  module Api
    class Connection
      include ::Quickblox::Api::RequestHelper

      def self.connect
        new.connect
      end

      def self.open_session
        new.open_session
      end

      attr_reader :connect, :session

      def initialize
        @connect = ::Faraday.new(url: ::Quickblox.config.server) do |faraday|
          faraday.request   ::Quickblox.config.request_type
          faraday.response  ::Quickblox.config.logger
          faraday.adapter   ::Quickblox.config.adapter
        end
      end


      def post(url, data, &block)
        @token = self.session.token

        res = connect.post do |request|
          request.url url
          request.headers['QB-Token'] = @token
          request.body = normalize(data)
        end

        $stderr.puts "\n\n#{url} Options: #{normalize(data)}\n\nResponse: #{res.inspect}\n\n"

        res
      end


      def with_session(meth, data, &block)
        connect.send(meth.to_sym) do |request|
          request.headers['QB-Token'] = session.token
          request.body = normalize(data)
          yield request
        end
      end

      def open_session
        data = normalize

        response = connect.post do |request|
          request.url   '/auth.json'
          request.body  = "#{data}&signature=#{signature(data)}"
        end

        if response.success?
          sess = parse_response(response.body, 'session')
          @session = ::Quickblox::Api::Session.new(sess) unless sess.empty?
        end

        self
      end


      def close_session
        response = connect.delete do |request|
          request.url "/session.json"
          request.headers['QB-Token'] = @session.token
        end

        @session = nil if response.success?

        self
      end


      private

      def parse_response(response_body, endpoint)
        ::JSON.parse(response_body).fetch(endpoint, [])
      end

    end
  end
end
