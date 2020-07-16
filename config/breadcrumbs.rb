crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_index_path
end

crumb :users_new do
  link "新規会員登録", new_user_registration_path
  parent :root
end

crumb :card do
  link "クレジットカード", new_card_path
  parent :mypage
end

crumb :login do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :products_show do
  link "商品詳細"
  parent :root
end

crumb :products_new do
  link "出品ページ"
  parent :root
end

