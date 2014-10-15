require 'test_helper'

module Quickblox
  class SignTest < Minitest::Test
    include TestHelper

    def setup
      Quickblox.config = options
    end

    def test_signing
      message = "application_id=1&auth_key=abc123&nonce=111&timestamp=123&user[login]=you&user[owner_id]=1&user[password]=me"

      sig = "90d077f8a1c649dd1622df8d432420121e02630b"

      assert_equal sig, Signer.sign!(message)
    end
  end
end
