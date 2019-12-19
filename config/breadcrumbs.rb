crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :profile do
  link "プロフィール", edit_user_path(current_user)
  parent :users
end

crumb :userinfo do
  link "本人情報の登録", userinfo_user_path(current_user)
  parent :users
end

crumb :items_new do
  link "出品する", new_item_path
  parent :users
end

crumb :logout_user do
  link "ログアウト", logout_user_path(current_user)
  parent :users
end


