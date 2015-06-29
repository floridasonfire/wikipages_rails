class CategoriesController < ApplicationController
  def index
    @categories = Category.all.sort_by{|object| object.name.downcase}
    render :index
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new()
    render :new
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy()
    redirect_to categories_path
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    render :edit
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
