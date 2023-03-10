class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret"
  
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end