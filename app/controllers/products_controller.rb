class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @products = Product.new
  end

  def create

  end

  def destroy

  end

  def update

  end

end
