# frozen_string_literal: true

require "kuby"
require_relative "metal/version"

module Kuby
  module Metal
    autoload :Config, "kuby/metal/config"
    autoload :Provider, "kuby/metal/provider"
  end
end

Kuby.register_provider(:metal, Kuby::Metal::Provider)
