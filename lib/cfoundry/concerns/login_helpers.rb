require "base64"

module CFoundry
  module LoginHelpers
    def login_prompts
      if (!@base.uaa.nil?)
        @base.uaa.prompts
      else
           {
              :password => ["password" , "Password"],
              :username => ["text","Email" ]
            }
      end
    end

    def login(username, password)
      if (!@base.uaa.nil?)
        @base.token = AuthToken.from_uaa_token_info(@base.uaa.authorize(username, password))
      else
            resp = MultiJson.load(@base.post("users",username,"tokens", :content => :json, :payload => '{"password":"'+password+'"}'))
            @base.token = AuthToken.new(resp['token'],nil)
      end
    end
  end
end