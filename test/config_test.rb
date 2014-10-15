require 'test_helper'

module Quickblox
  class ConfigTest < Minitest::Test
    include TestHelper

    def test_config_setup
      Quickblox.config = options
      assert_options_for Quickblox.config
    end

  end
end
