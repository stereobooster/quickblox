require 'test_helper'

class QuickbloxTest < Minitest::Test
  include ::Quickblox::TestHelper
  include ::Quickblox::TestHelper::Credentials

  def test_config
    Quickblox.config = options
    assert_options_for Quickblox.config
  end

end
