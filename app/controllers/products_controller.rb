class ProductsController < ApplicationController

  def index
    # uses MODEL
    @products = Product.all.order(created_at: :desc)
    # View
    # render :index implicitly called by similarity in method's name
  end

  def show
    @product = Product.find params[:id]
  end

end
