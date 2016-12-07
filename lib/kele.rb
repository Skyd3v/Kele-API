require 'httparty'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1'

    def initialize(username, password)
        @options = { query: { email: username, password: password } }

        if @options
            @auth_token = self.class.post('/sessions', @options)
        else
            raise StandardError('Error validating login credentials')
        end
    end
end
