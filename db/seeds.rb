# 商品テーブル
def product_seed
  time = Time.now
  year = time.year # 現在年を取得 
  
  category_list = { 1 => {"name" => "食品",
                          "image" => "food.jpg"},
                    2 => {"name" => "家電", 
                          "image" => "electric_appliances.jpg"},
                    3 => {"name" => "化粧品", 
                          "image" => "cosmetic.jpg"},
                    4 => {"name" => "サプリメント", 
                          "image" => "supplement.jpg"},
                  }

  PRODUCT_NUM.times do |num|
    num_ten_digits = sprintf("%010d", num+1) # 10桁の数値
    category_random_key = rand(1..category_list.length)

    date_from = Date.parse("2010/01/23")
    date_to = Date.parse("2022/06/25")
    date_random = Random.rand(date_from .. date_to)
    
    Product.create!(
        no: "#{year}#{num_ten_digits}", # 現在年 + 10桁の連番
        name: "テスト商品#{num + 1}",
        category: category_list[category_random_key]["name"],
        image_path: category_list[category_random_key]["image"],
        description: "テスト商品説明#{num + 1}",
        price: rand(100..10000),
        release_date: date_random,
        maker_id: rand(1..MAKER_NUM)
    )
  end
end

# メーカテーブル
def maker_seed
  MAKER_NUM.times do |num|
    
    Maker.create!(
        name: "テストメーカ#{num + 1}",
        description: "テストメーカ説明#{num + 1}"
    )
  end
end

# レビューテーブル
def review_seed
  REVIEW_NUM.times do |num|
    price_evaluation = rand(1..5) # 1-5段階評価
    design_evaluation = rand(1..5) # 1-5段階評価
    quality_evaluation = rand(1..5) # 1-5段階評価
    total_evaluation = ((price_evaluation + design_evaluation + quality_evaluation) / 3.to_f).floor(1) # 小数点1桁までの平均値

    Review.create!(
      product_id: rand(1..PRODUCT_NUM),
      review_user_name: "テストユーザ名#{num+1}",
      content: "テストレビュー内容#{num+1}",
      tag: "使い心地 成分 価格",
      total_evaluation: total_evaluation,
      price_evaluation: price_evaluation,
      design_evaluation: design_evaluation,
      quality_evaluation: quality_evaluation
    )
  end

end

# 商品の数
PRODUCT_NUM = 20
# メーカの数
MAKER_NUM = 10
# レビューの数
REVIEW_NUM = 100


# seed実行
maker_seed
product_seed
review_seed




