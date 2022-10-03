class UserMailer < ApplicationMailer
  default from: "support@fair-market.com"

  def welcome_mail
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to fair-market!")
  end

  def order_created
    @email = params[:email]
    @name = params[:name]
    @total_amount = params[:total_amount]
    mail(to: @email, subject: "Order is ready")
  end
end
