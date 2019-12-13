crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", users_path
  parent :root
end

crumb :edit do
  link "プロフィール", edit_user_path(current_user)
  parent :users
end

crumb :show do
  link "本人情報の登録", user_path(current_user)
  parent :users
end

crumb :items do
  link "出品", new_item_path
  parent :users
end


