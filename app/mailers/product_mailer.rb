class ProductMailer < ApplicationMailer
  default from: "news@fair-market.com"

  def price_is_changed
    @user = params[:user]
    @product = params[:product]

    mail(to: @user.email, subject: 'Let\'s see the new price')
  end
end
