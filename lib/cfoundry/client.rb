require "cfoundry/baseclient"
require "cfoundry/rest_client"
require "cfoundry/auth_token"

require "cfoundry/v1/app"
require "cfoundry/v1/framework"
require "cfoundry/v1/runtime"
require "cfoundry/v1/service"
require "cfoundry/v1/service_plan"
require "cfoundry/v1/service_instance"
require "cfoundry/v1/user"

require "cfoundry/v2/app"
require "cfoundry/v2/service"
require "cfoundry/v2/service_binding"
require "cfoundry/v2/service_instance"
require "cfoundry/v2/service_plan"
require "cfoundry/v2/service_auth_token"
require "cfoundry/v2/user"
require "cfoundry/v2/organization"
require "cfoundry/v2/space"
require "cfoundry/v2/domain"
require "cfoundry/v2/route"
require "cfoundry/v2/stack"
require "cfoundry/v2/quota_definition"
require "cfoundry/v2/app_event"

require "cfoundry/v1/base"
require "cfoundry/v1/client"
require "cfoundry/v2/base"
require "cfoundry/v2/client"

module CFoundry
  class Client < BaseClient
    def self.new(*args)
      target, _ = args

      base = super(target)

      case base.info[:version]
      when 2
        CFoundry::V2::Client.new(*args)
      else
        CFoundry::V1::Client.new(*args)
      end
    end
  end
end
