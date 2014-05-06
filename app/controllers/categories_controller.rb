class CategoriesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @category = @product.categories.create(user_params)
    redirect_to @product, :notice => "Comment created!"  
  end

private

  def user_params
    params.require(:category).permit(:ct_name,:ct_message)
  end
end
