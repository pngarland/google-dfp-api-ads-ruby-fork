module DfpApi
  class CustomAuthHandler

    def initialize(config, scope)
      puts 'init custom auth handler...'
      @config = config
      @scope = scope
    end

    def property_changed(prop, value)
      binding.pry
    end

    def handle_error(error)
      binding.pry
    end

    def auth_string(credentials)
      puts 'auth_string...'
      creds = credentials[:oauth2_token]
      @network_id = creds[:network_id]
      @refresh_token = creds[:refresh_token]
      token = get_token(credentials[:oauth2_token])
      format('Bearer %s', token[:access_token])
    end

    def get_token(credentials = nil)
      puts 'get token...'
      if (Time.now.to_i - credentials[:issued_at]) > 3300
        refresh_token!
      else
        token_from_credentials(credentials)
      end
    end

    def refresh_token!()
      @client ||= create_client
      auth_params = {
        refresh_token: @refresh_token,
        client_id:  ENV['DFP_CLIENT_ID'],
        client_secret:  ENV['DFP_CLIENT_SECRET'],
        grant_type: 'refresh_token'
      }
      response = @client.post('/o/oauth2/token', auth_params)
      if response.status == 200
        @token = token_from_response(response)
      else
        raise format('problem with refresh token: %s', response.body)
      end
    end

    def create_token(credentials)
      binding.pry
      # @client ||= create_client()
    end

    private

    def create_client
      client = Patron::Session.new
      client.timeout = 20
      client.connect_timeout = 20
      client.base_url = 'https://accounts.google.com'
      client
    end

    def token_from_credentials(credentials)
      {
        access_token: credentials[:access_token],
        refresh_token: @refresh_token,
        issued_at: credentials[:issued_at],
        expires_in: 3600 - (Time.now.to_i - credentials[:issued_at])
      }
    end

    def token_from_response(response)
      token = JSON.parse(response.body)
      Network.find(@network_id).update_from_refresh_token(token)
      {
        access_token: token['access_token'],
        refresh_token: @refresh_token,
        issued_at: Time.now.to_i,
        expires_in: token['expires_in']
      }
    end

  end
end
