class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:category][:name])
    if @category.save
      redirect_to @category
    else
      flash[:warning] = 'Warning! All fields are mandatory.'
      render :new
    end
  end
end
