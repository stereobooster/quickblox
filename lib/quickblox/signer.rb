require 'openssl'
require 'base64'

#
# HMAC Signer
#
module Quickblox
  class Signer
    def self.sign!(message)
      new(message).sign
    end

    def initialize(message)
      @key      = Quickblox.config.auth_secret
      @message  = message
    end

    def sign
      hmac_message
    end

    private

    def encode_hmac
      ::Base64.strict_encode64( hmac_message )
    end

    def hmac_message
      ::OpenSSL::HMAC.hexdigest(digest, @key, @message)
    end

    def digest
      ::OpenSSL::Digest.new("sha1")
    end
  end
end
