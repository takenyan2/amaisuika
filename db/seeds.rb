# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "aaa@aaa", user_name: "管理者テスト", kana_user_name: "カンリシャテスト", nick_name: "管理者テスト", postal_code: 1111111, address: "東京都テスト区", phone_number: "11111111111", user_status: 1, password: "aaaaaa", password_confirmation: "aaaaaa")
User.create(email: "bbb@bbb", user_name: "ユーザーテスト", kana_user_name: "ユーザーテスト", nick_name: "ユーザーテスト", postal_code: 2222222, address: "東京都ユーザーテスト区", phone_number: "22222222222", user_status: 0, password: "bbbbbb", password_confirmation: "bbbbbb")
Shop.create(email: "a@a", prefecture: "東京都", shop_name: "aaa", shop_introduction: "aaaaa", send_period: 3, shop_phone_number: "11111111111", password: "aaaaaa", password_confirmation: "aaaaaa")
Shop.create(email: "b@b", prefecture: "東京都", shop_name: "bbb", shop_introduction: "bbbbb", send_period: 5, shop_phone_number: "11111111111", password: "bbbbbb", password_confirmation: "bbbbbb")
Shop.create(email: "c@c", prefecture: "東京都", shop_name: "ccc", shop_introduction: "ccccc", send_period: 3, shop_phone_number: "11111111111", password: "cccccc", password_confirmation: "cccccc")
Product.create(shop_id: 1, product_name: "ショップ１の商品", product_introduction: "なかなかやろ", product_genre: "あまいスイカ", product_price: 3000, product_stock: 20, permission: false)
Product.create(shop_id: 2, product_name: "二番の商品だよ", product_introduction: "一番よりにばん", product_genre: "あまいスイカGoods", product_price: 2500, product_stock: 30, permission: false)
Product.create(shop_id: 3, product_name: "まるで地球のように丸いよ", product_introduction: "美味しいよ", product_genre: "あまいスイカ", product_price: 2000, product_stock: 10, permission: false)
Product.create(shop_id: 1, product_name: "糖度やばいよ。病みつきになるよ", product_introduction: "めちゃあまい", product_genre: "あまいスイカ", product_price: 1800, product_stock: 15, permission: true)
Product.create(shop_id: 2, product_name: "スイカの浮き輪", product_introduction: "かわいーい", product_genre: "あまいスイカGoods", product_price: 3300, product_stock: 25, permission: true)
Comment.create(user_id: 2, product_id: 1, review: 5, comment: "テストじゃああああ" )
Comment.create(user_id: 2, product_id: 1, review: 3, comment: "テストテステス" )
Comment.create(user_id: 2, product_id: 2, review: 4, comment: "テストコメント" )
Comment.create(user_id: 2, product_id: 3, review: 2, comment: "これでも高評価" )
Comment.create(user_id: 1, product_id: 1, review: 5, comment: "テストンンンン" )
Comment.create(user_id: 1, product_id: 1, review: 3, comment: "普通にいいと思う" )
Comment.create(user_id: 1, product_id: 2, review: 4, comment: "なかなかの商品" )
Comment.create(user_id: 1, product_id: 3, review: 1, comment: "買って損した" )
PurchaseHistory.create(user_id: 2, send_name:"テスト１",send_address:"アドレステスト",send_postal_code: 1111111, purchase_at: Date.new(2019,1,15))
PurchaseHistory.create(user_id: 2, send_name:"あかさたな",send_address:"はまやらわ",send_postal_code: 1111111, purchase_at: Date.new(2019,1,16))
PurchaseHistory.create(user_id: 2, send_name:"いきしちに",send_address:"ひみいりい",send_postal_code: 1111111, purchase_at: Date.new(2019,1,17))
