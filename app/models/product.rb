class Product < ApplicationRecord
  has_many :reviews
  belongs_to :maker, optional: true

  #
  # 商品一覧を取得
  #
  # @param [String] product_search_word 商品番号または商品名の部分一致で検索
  # @param [String] order_condition 並び替えの指定
  #
  # @return [ActiveRecord_Relation] result 商品一覧データ
  #
  def fetch_products(product_search_word = "", order_condition = "")
    result = Product.joins(:maker, :reviews)
              .select(
                'products.*, makers.name as alias_maker_name, count(reviews.*) AS review_sum,
                trunc(CAST(avg(reviews.total_evaluation) as numeric), 1) as review_avg' # total_evaluationの平均値を少数点1桁で切り捨て
              ).group("products.id, makers.id") # 商品には必ずメーカが登録されている前提でのグループ化


    if (product_search_word != "") then
      product_search_word = Product.new.convert_search_word(product_search_word)

      result = result.merge(result.where("products.no LIKE '%#{product_search_word}%'").or(result.where("products.name LIKE '%#{product_search_word}%'")))
   
    end

    if (order_condition != "") then
      case order_condition
      # 評価の高い順
      when "1" then
        result = result.order(review_avg: "DESC")
      # レビューの多い順
      when "2" then
        result = result.order(review_sum: "DESC")
      # 商品の新しい順
      when "3" then
        result = result.order(release_date: "DESC")
      end
    end

    result
  end


  #
  # 特定の商品を取得
  #
  # @param [String] product_id 取得する商品のid
  #
  # @return [ActiveRecord_Relation] 商品データ
  #
  def fetch_product(product_id)
    result = Product
        .joins(:maker, :reviews)
        .where(id: product_id)
        .select(
          'products.*, makers.id as alias_maker_id, makers.name as alias_maker_name, makers.description as alias_maker_description, count(reviews.*) AS review_sum,
          trunc(CAST(avg(reviews.total_evaluation) as numeric), 1) as review_avg' # total_evaluationの平均値を少数点1桁で切り捨て
        ).group("products.id, makers.id") # 商品には必ずメーカが登録されている前提でのグループ化
        .first
    
    result
  end
end
