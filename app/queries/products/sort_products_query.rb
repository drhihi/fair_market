class Products::SortProductsQuery < ApplicationQuery
  def initialize(products, params)
    @products = products
    @params = params
  end

  def call
    sort_by_price
    sort_by_categories

    @products
  end

  private

  def sort_by_price
    @products = @products.order(price: @params[:price]) if %w[asc desc].include? @params[:price]
    @products = @products.where('price >= ?', @params[:min_price]) if @params[:min_price].present?
    @products = @products.where('price <= ?', @params[:max_price]) if @params[:max_price].present?
  end

  def sort_by_categories
    return unless @params[:category_ids].present?
    @products = @products.joins(:categories)
                         .where(categories: { id: @params[:category_ids] })
  end
end
