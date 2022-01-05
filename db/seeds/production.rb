# アドミン
Admin.find_or_create_by(id: 1) do |admin|
  admin.email = ENV['ADMIN_EMAIL']
  admin.password = ENV['ADMIN_PASSWORD']
end
