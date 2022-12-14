class OrderItemsController < ApplicationController
  before_action :set_product

  def create
    if @order_item
      @order_item.increment!(:quantity)
    else
      @order_item = current_order.order_items.create(product_id: params[:product_id])
    end

    flash[:notice] = "#{ @order_item.product.title } added to the cart."
    redirect_to do
      format.turbo_stream
    end
  end

  def update
    value = params[:method] == "increment" ? 1 : -1
    @order_item.increment(:quantity, value)

    if @order_item.save
      flash.alert = 'Updated'
    else
      flash.alert = @order_item.errors.full_messages[0]
    end
    redirect_to root_path
  end

  def destroy
    @order_item.destroy
    flash.alert = "#{ @order_item.product.title } was delete from the cart."
    redirect_to order_path(current_order)
  end

  private

  def set_product
    @order_item = current_order.order_items.find_by(product: params[:product_id])
  end
end

