module Checkpoint
    def get_checkpoint(checkpoint_id)
        response = self.class.get('/checkpoints/' + checkpoint_id.to_s, headers: { 'authorization' => @auth_token })
        JSON.parse(response.body).to_a
    end
end
