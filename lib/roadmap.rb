module Roadmap
    def get_roadmap(roadmap_id)
        response = self.class.get('/roadmaps/' + roadmap_id.to_s, headers: { 'authorization' => @auth_token })
        JSON.parse(response.body).to_a
    end
end
