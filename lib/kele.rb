require 'httparty'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1'

    def initialize(username, password)
        @auth_token = self.class.post('/sessions', body: { email: username, password: password })['auth_token']
        raise StandardError, 'Error validating login credentials' unless @auth_token
    end

    def get_me
        response = self.class.get('/users/me', headers: { 'authorization' => @auth_token })
        JSON.parse(response.body)
    end
  end
