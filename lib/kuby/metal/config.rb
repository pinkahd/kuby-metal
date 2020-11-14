# frozen_string_literal: true

require "kube-dsl"

module Kuby
  module Metal
    class Config
      extend ::KubeDSL::ValueFields

      value_field :kube_config_path, default: "~/.kube/config"
    end
  end
end
