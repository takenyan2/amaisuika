class CommentsController < ApplicationController

	def create
		product = Product.find(params[:product_id])
    	comment = current_user.comments.new(comment_params)
    	comment.product_id = product.id
    	comment.save
    	redirect_to product_path(product)
end
	end

	def destroy
	end

	private
	def comment_params
  		params.require(:comment).permit(:user_id, :product_id, :review, :comment)
end
