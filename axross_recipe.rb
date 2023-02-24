# 商品データ
products = [
    {name: "マグロ", price: 150},
    {name: "中トロ", price: 150},
    {name: "大トロ", price: 290},
    {name: "えび", price: 100},
    {name: "サーモン", price: 150},
    {name: "大トロサーモン", price: 150},
    {name: "えんがわ", price: 150},
    {name: "ぶり", price: 150},
    {name: "うなぎ", price: 150},
    {name: "いか", price: 150},
]
# 商品を表示
puts "商品を選んでください。"
products.each.with_index(1) do |product, i|
  puts "#{i}. #{product[:name]}(#{product[:price]}円)"
end

# 商品を選択
print "商品の番号を選択 > " 
select_product_num = gets.to_i
# 選択した番号と講座番号を一致させる
chosen_product = products[select_product_num - 1]

# 個数の選択
puts "#{chosen_product[:name]}ですね。個数を指定してください。"
print "個数入力 > "
quantity_of_product = gets.to_i

# 合計金額の計算
total_price = chosen_product[:price] * quantity_of_product
# 5個以上ならば10%割引
if quantity_of_product >= 5
  puts "5個以上なので10%割引となります。"
  puts "現在の値段:#{total_price}(割引適用外)"
  total_price *= 0.9
  puts "#{total_price.floor}円(割引適用)"
end

puts "合計金額は#{total_price.floor}円です"
puts "お買い上げありがとうございます。"
