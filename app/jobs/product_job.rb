class ProductJob < ApplicationJob
  queue_as :default

  def perform(product)
    User.all.each do |user|
      ProductMailer.with(user: user, product: product).price_is_changed.deliver_later
    end
  end

end
