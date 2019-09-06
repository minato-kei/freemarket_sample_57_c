# ルート
crumb :root do
  link "トップページ", root_path
end

# マイページ
crumb :show do
  link "マイページ", user_path
end
