class ReviewsController < ApplicationController
  # レビュー画面
  def index
    @product_id = params[:id]
    @review = Review.new
    @reviews = Review.all.where(product_id: @product_id)
  end

  # レビューの保存処理
  def new
    @review = params.require(:review).permit(:review_user_name, :product_id, :content, :tags, 
                                      :price_evaluation, :design_evaluation, :quality_evaluation, :total_evaluation)

    if Review.create(@review)
      redirect_to "/items/#{params[:review][:product_id]}/reviews"
    end
  end


end
