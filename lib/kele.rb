require 'httparty'
require './lib/checkpoint'
require './lib/roadmap'

class Kele
    include HTTParty
    include Roadmap
    include Checkpoint
    base_uri 'https://www.bloc.io/api/v1'

    def initialize(username, password)
        @auth_token = self.class.post('/sessions', body: { email: username, password: password })['auth_token']
        raise StandardError, 'Error validating login credentials' unless @auth_token
    end

    def get_me
        response = self.class.get('/users/me', headers: { 'authorization' => @auth_token })
        JSON.parse(response.body).to_a
    end

    def get_mentor_availability(mentor_id)
        response = self.class.get('/mentors/' + mentor_id.to_s + '/student_availability', headers: { 'authorization' => @auth_token })
        JSON.parse(response.body).to_a
  end
  end
