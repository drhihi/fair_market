class OrderUpdateService
  def initialize(order, order_params)
    @order = order
    @order_params = order_params
  end

  def call
    @order.update(@order_params)

    UserMailer.with(name: @order.name,
                    email: @order.email,
                    total_amount: @order.total_amount)
              .order_created
              .deliver_later

    @order.status_ordered!

    OpenStruct.new(success: false) if @order.errors.any?
  end
end
