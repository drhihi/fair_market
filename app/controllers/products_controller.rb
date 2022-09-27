class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update]

  def index
    @pagy, @products = pagy(Product.all, items: 12)
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, images: [])
  end

end
