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

# ログアウト
# crumb :logout do
#   link "ログアウト", logout_user_path
#   parent :show
# end

