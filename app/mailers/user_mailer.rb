class UserMailer < ApplicationMailer
  default :from => "support@street-sweeping-bos.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to this Boston Street Sweeping Notifications.")
  end
end
