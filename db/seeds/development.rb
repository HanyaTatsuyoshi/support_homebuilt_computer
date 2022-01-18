# アドミン
Admin.find_or_create_by(id: 1) do |admin|
  admin.email = "example@example.com"
  admin.password = "foobar"
end

# ユーザー
99.times do |n|
  email = "example-#{n+1}@example.com"
  password = "password"
  agreement = "1"
  User.create!(email:        email,
               password:     password,
               confirmed_at: Time.now,
               agreement: agreement)
end

# カスタム
users = User.order(:created_at).take(6)
50.times do
  parts = []
  urls  = []
  price = []
  13.times do
    parts << Faker::Lorem.sentence(word_count: 1)
    urls << Faker::Lorem.sentence(word_count: 1)
    price << rand(5000..20000)
  end
  users.each { |user| user.customs.create!(cpu: parts[0], gpu: parts[1], os: parts[2], memory: parts[3],
                                           case: parts[4], m2: parts[5], ssd: parts[6], hdd: parts[7],
                                           psu: parts[8], motherboard: parts[9], cooler: parts[10],
                                           peripheral: parts[11], name: parts[12],
                                           cpu_url: urls[0], gpu_url: urls[1], os_url: urls[2],
                                           memory_url: urls[3], case_url: urls[4], m2_url: urls[5],
                                           ssd_url: urls[6], hdd_url: urls[7], psu_url: urls[8],
                                           motherboard_url: urls[9], cooler_url: urls[10],
                                           peripheral_url: urls[11],
                                           cpu_price: price[0], gpu_price: price[1], os_price: price[2],
                                           memory_price: price[3], case_price: price[4], m2_price: price[5],
                                           ssd_price: price[6], hdd_price: price[7], psu_price: price[8],
                                           motherboard_price: price[9], cooler_price: price[10],
                                           peripheral_price: price[11]) }
end
  