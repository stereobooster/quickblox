require_relative "quickblox/version"
require_relative "quickblox/config"
require_relative "quickblox/railtie"
require_relative "quickblox/parameter_building"
require_relative "quickblox/signer"
require_relative "quickblox/parameters"
require_relative "quickblox/api"


module Quickblox
  extend self

  def config=(configuration)
    @config = Config.setup( configuration )
  end

  def config
    @config
  end

  def logger=(logger)
    @logger = logger
  end

  def logger
    @logger
  end
end
