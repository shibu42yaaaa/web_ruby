# 運賃の10%たまる + (paica * 0.1)
# ポイント >= 支払い運賃(ポイントが使われる)
# ポイント支払いはポイントは追加されない

paica_money = 2000
paica_point = 0
fee = 300


if paica_point >= fee
  puts paica_point - fee
else
  puts  paica_money - fee
  puts paica_point += 30
end

