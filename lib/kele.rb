require 'httparty'
require './lib/checkpoint'
require './lib/roadmap'
require './lib/message'

class Kele
  include HTTParty
  include Roadmap
  include Checkpoint
  include Message
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(username, password)
    @auth_token = self.class.post('/sessions', body: { email: username, password: password })["auth_token"]
    raise StandardError.new('Error validating login credentials') unless @auth_token
  end

  def get_me
    response = self.class.get('/users/me', headers: { "authorization" => @auth_token })
    JSON.parse(response.body).to_hash
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get('/mentors/'+ mentor_id.to_s + '/student_availability', headers: { "authorization" => @auth_token })
    JSON.parse(response.body).to_a
  end

  def get_messages(*page_number)
    response = self.class.get('/message_threads', headers: { "authorization" => @auth_token }, values: { "page": page_number })
    JSON.parse(response.body)
  end

  def create_message(user_id, recipient_id, subject, stripped_text)
    response = self.class.post('/messages',
                              headers: { "authorization" => @auth_token },
                              body: {
                                "user_id": user_id,
                                "recipient_id": recipient_id,
                                "subject": subject,
                                "stripped-text": stripped_text
                              })
    JSON.parse(response.body)
  end
end
