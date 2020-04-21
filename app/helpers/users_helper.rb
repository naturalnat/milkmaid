# frozen_string_literal: true

module UsersHelper
  def self.getusername(user_id)
    @user = User.find(user_id)
    @user.email.partition('@').first
  end
end
