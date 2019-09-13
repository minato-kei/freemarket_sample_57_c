# ルート
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :show do
  link "マイページ", user_path
end

# プロフィール
crumb :profile do
  link "プロフィール", profile_user_path
  parent :show
end

# 本人情報の登録
crumb :edit do
  link "本人情報の登録", edit_user_path
  parent :show
end

# ユーザーログアウト
crumb :logout do
  link "ログアウト", logout_user_path
  parent :show
end

# これより以下は取引関連のパスがまだ未定
# 出品した商品-出品中
crumb :sellings_selling do
  link "出品した商品-出品中", _path
  parent :show
end

# 出品した商品-取引中
crumb :sellings_progress do
  link "出品した商品-取引中", _path
  parent :show
end

# 出品した商品-売却済
crumb :sellings_completed do
  link "出品した商品-売却済", _path
  parent :show
end

# 購入した商品-取引中
crumb :buying do
  link "購入した商品-取引中", _path
  parent :show
end

# 購入した商品-過去の取引
crumb :bought do
  link "購入した商品-過去の取引", _path
  parent :show
end