# frozen_string_literal: true

module Kuby
  module Metal
    class Provider < ::Kuby::Kubernetes::Provider
      STORAGE_CLASS_NAME = "standard"

      attr_reader :config

      def configure(&block)
        config.instance_eval(&block) if block
      end

      def kubeconfig_path
        config.kube_config_path
      end

      def after_setup
        if nginx_ingress = environment.kubernetes.plugin(:nginx_ingress)
          service = ::KubeDSL::Resource.new(
            kubernetes_cli.get_object("service", nginx_ingress.namespace, nginx_ingress.service_name)
          )

          # Convert from Local to Cluster here so a DigitalOcean load balancer,
          # which sits in front of the ingress controller, is accessible by pods
          # running on the same node as the controller. We have to do this
          # because of a k8s bug:
          #
          # https://github.com/kubernetes/kubernetes/issues/87263
          # https://github.com/kubernetes/kubernetes/issues/66607
          #
          # Word on the street is this is fixed in v1.17 (DO is currently on 1.16).
          # Hopefully we can rip this out in the near future.
          #
          # This was discovered because cert-manager's self-check step attempts to
          # verify external access to its ACME challenge ingress/service, but times
          # out because k8s' iptables rules prevent it from going through the DO
          # load balancer and therefore nginx.
          service.contents["spec"]["externalTrafficPolicy"] = "Cluster"
          kubernetes_cli.apply(service)
        end
      end

      def storage_class_name
        STORAGE_CLASS_NAME
      end

      def kubernetes_cli
        @kubernetes_cli ||= ::KubernetesCLI.new(kubeconfig_path)
      end

      private

      def after_initialize
        @config = Config.new
      end
    end
  end
end
