class ProductsController < ApplicationController

  # 商品の一覧表示画面
  def index
    # 検索・並び替え条件
    @product_search_word = params[:product_search_word] ? params[:product_search_word] : ""
    @order_conditon = params[:order_conditon] ? params[:order_conditon] : ""

    @products = Product.new.fetch_products(@product_search_word, @order_conditon)

  end

  # 商品の詳細画面
  def detail
    product_id = params[:id]

    # 選択された商品
    @product = Product.new.fetch_product(product_id)
    
    # 同一メーカの他商品
    @other_products = Product
                        .where(maker_id: @product.maker_id)
                        .where("products.id != #{product_id}")

  end
end
