module Message

  attr_accessor :id, :token, :subject, :updated_at,
                :unread, :user_image, :preview,
                :first_name, :last_name, :page

  def initialize(id, token, subject, updated_at, unread, user_image, preview, first_name, last_name, page)
    @id, @token, @subject, @updated_at, @unread, @user_image, @preview, @first_name, @last_name, @page = id, token, subject, updated_at, unread, user_image, preview, first_name, last_name, page
  end
end 
