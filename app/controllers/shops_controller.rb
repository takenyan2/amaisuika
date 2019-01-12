class ShopsController < ApplicationController
  def main

  end

  def index
    @products = Product.all
    @shops = Shop.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def follow
  end

  def seach
  end

  def prefectures
  end

  def update
  end

  def destroy
  end
end
