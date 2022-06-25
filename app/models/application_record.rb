class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #
  # 引数の文字列をLIKE文の部分一致用文字列に変換
  # ・空白を削除
  # ・文字列の左右に'%'を付与
  #
  # @param [String] str 文字列
  # @return [String] result
  #
  def convert_search_word(str = "")
    # 空白を削除
    non_blank_str = str.gsub(/ |　/, "")
    result = "%#{non_blank_str}%"
  end
end
