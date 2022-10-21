class OrdersController < ApplicationController
  def show
    # @items = current_order.order_items.order(created_at: :asc)
    # order_items = current_order.order_items
    # @items = OrderItems::OrderItemsWithProductsQuery.call(order_items, order_id: current_order.id)
    @items = OrderItems::OrderItemsWithProductsQuery.call(order_id: current_order.id)
  end

  def update
    current_order.update(order_params)

    UserMailer.with(name: current_order.name,
                    email: current_order.email,
                    total_amount: current_order.total_amount)
              .order_created
              .deliver_later

    current_order.status_ordered!
    # result = OrderUpdateService.new(current_order, order_params).call
    # if result.success do
    # end
    redirect_to root_path, notice: 'Order confirmed'
  end

  def checkout; end

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :address)
  end
end
