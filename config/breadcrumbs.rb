#ルート
crumb :root do
  link "トップページ", root_path
end

#マイページ
crumb :mypage do
  link "マイページ", mypage_index_path
end

# 会員情報入力ページ(1ページ)
crumb :users_new do
  link "新規会員登録", new_user_registration_path
  parent :root
end

#クレジットカード登録
crumb :card do
  link "クレジットカード", new_card_path
  parent :mypage
end

# ログイン
crumb :login do
  link "ログイン", new_user_session_path
  parent :root
end

# 商品詳細ページ
crumb :products_show do
  link "商品詳細"
  parent :root
end

# 出品ページ
crumb :products_new do
  link "出品ページ"
  parent :root
end

