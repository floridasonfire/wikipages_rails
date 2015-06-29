class BusinessesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @business = @category.businesses.new()
    render :new
  end

  def show
    @business = Business.find(params[:id])
  end
  
  def create
    @category = Category.find(params[:category_id])
    @business = @category.businesses.new(business_params)
    if @business.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :website, :phones, :hours)
  end
end
