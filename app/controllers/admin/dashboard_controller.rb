class Admin::DashboardController < ApplicationController
  # force user's to login before they can see the actions in this controller

  before_filter :authorize

  http_basic_authenticate_with :name => ENV['USERNAME'] , :password => ENV['PASSWORD']

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
