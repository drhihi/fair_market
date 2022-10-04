class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update]

  def index
    products = Product.all
    products = products.order(price: params[:price]) if %w[asc desc].include? params[:price]
    products = products.where('price >= ?', params[:min_price]) if params[:min_price].present?
    products = products.where('price <= ?', params[:max_price]) if params[:max_price].present?
    products = products.joins(:categories)
                       .where(categories: { id: params[:category_ids] }) if params[:category_ids].present?
    @categories = Category.left_joins(:products)
                          .select('categories.id, categories.title, COUNT(products.id) products_count')
                          .group(:id)
                          .order(:title)
    @pagy, @products = pagy(products)
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

  def fetch_products
    ProductFetchJob.set(wait: 10).perform_later
    # redirect_to root_path, notice: "Product was created"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, images: [])
  end

end
