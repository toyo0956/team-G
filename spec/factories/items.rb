FactoryBot.define do
  # ダミーのインスタンスの作成
  factory :item do
    name         {"猫"}
    description  {"動物"}
    category     {"メンズ"}
    condition    {"未使用"}
    feepayer     {"送料込み(出品者負担)"}
    # method       {"未定"} エラー出るのでコメントアウトします。メソッドとして読み込む？
    region_id    {"4"}
    days         {"1〜2日で発送"}
    price        {"100"}
  end  
end