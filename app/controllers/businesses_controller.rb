class BusinessesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @business = @category.businesses.new()
    render :new
  end

  def show
    @category = Category.find(params[:category_id])
    @business = Business.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @business = @category.businesses.new(business_params)
    @business.phones = params[:phones]
    if @business.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to category_path(@category)
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :website, :hours)
  end
end
