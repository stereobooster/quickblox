require 'rails/railtie'

module Quickblox
  module Rails
    class Railtie < ::Rails::Railtie

      initializer "quickblox.setup", group: :all do |app|
        ::Quickblox.config = app.config_for(:quickblox)
      end

    end
  end
end
