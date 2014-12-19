module DfpApi
  class CustomAuthHandler

    def initialize(config, scope)
      binding.pry
    end

    def property_changed(prop, value)
      binding.pry
    end

    def handle_error(error)
      binding.pry
    end

    def auth_string(credentials)
      binding.pry
      format('Bearer %s', @config[:oauth2_token][:access_token])
    end

    def get_token(credentials = nil)
      binding.pry
    end

    def refresh_token!()
      binding.pry
    end

    def create_token(credentials)
      binding.pry
      # @client ||= create_client()
    end




    private

    def create_client

      Signet::OAuth2::Client.new(
        authorization_uri: "https://accounts.google.com/o/oauth2/auth",
        token_credential_uri: "https://accounts.google.com/o/oauth2/token",
        client_id: "62261930460-ccem5744aomcu3ms2hjkds2dfadhv5l3.apps.googleusercontent.com",
        client_secret: "_6aODKmDoYvJEmI1yoxQUrxn",
        scope: "https://www.googleapis.com/auth/dfp",
        redirect_uri: "urn:ietf:wg:oauth:2.0:oob"
      )
    end

    def retrieve_token(client)
      {
        :access_token => client.access_token,
        :refresh_token => client.refresh_token,
        :issued_at => client.issued_at,
        :expires_in => client.expires_in,
        :id_token => client.id_token
      }
    end

  end
end
