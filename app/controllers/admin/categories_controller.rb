class Admin::CategoriesController < ApplicationController
  before_action :admin_authenticate
  def index
    @categories = Category.order(id: :asc).all
  end
end