class UserMailer < ApplicationMailer
  default from: "support@fair-market.com"

  def welcome_mail
    @user = params[:user]

    mail(to: @user.email, subject: "Welcome to fair-market!")
  end
end
