# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

num = 0
(1..20).each do |i|
  num = num + 1
  truck = Truck.new
  truck.number = "인천 가 " + (num+1000).to_s
  if i%3 == 0
    truck.category = "일반"
  elsif i%3 == 1
    truck.category = "윙"
  elsif i%3 == 2
    truck.category = "탑"
  end

  if i%4 == 0
    truck.size = 1
  elsif i%4 == 1
    truck.size = 1
  elsif i%4 == 2
    truck.size = 1
  elsif i%4 == 3
    truck.size = 1
  end
  truck.save

  driver = TruckDriver.new
  driver.name = "최석원" + num.to_s
  driver.truck = truck
  driver.save

  company = TruckingCompany.new 
  company.settlement_period = i%30
  company.drivers.push(driver)
  company.save

  license = BusinessLicense.new
  license.reg_number = "123-123-" + (num+1000).to_s
  license.company_name = "운송회사" + num.to_s
  license.director_name = "대표" + num.to_s
  license.company = company
  license.save

  client = Client.new
  client.settlement_period = (i+7)%30
  client.save

  license = BusinessLicense.new
  license.reg_number = "123-123-" + (num+1000).to_s
  license.company_name = "제조회사" + num.to_s
  license.director_name = "대표" + num.to_s
  license.company = client
  license.save

  manager = Manager.new
  manager.name = "관리자" + num.to_s
  manager.phone_number = "010-2943-5025"
  manager.email = "abc@example.com"
  manager.client = client
  manager.save
end

puts "Created Truck related dummy data"

num = 0 
(1..100).each do |i|
  num = num + 1
  address = Address.new
  address.postcode = "123-123-" + num.to_s
  address.new_address = "도로명 주소" + num.to_s
  address.old_address = "지번 주소" + num.to_s
  address.detail_address = "상세 주소" + num.to_s
  address.english_address = "English Address" + num.to_s
  address.save
end 

puts "Created Address dummy data"

num = 0
(1..100).each do |i|
  num = num + 1 
  station = Station.new
  station.address = Address.all.shuffle[0]
  station.company_name = "실화주" + num.to_s
  station.manager = Manager.all.shuffle[0]
end

puts "Created Station dummy data"

num = 0
(1..100).each do |i|
  order = Order.new
  order.status = i%5
  order.manager = Manager.all.shuffle[0]
  order.sales = 100
  order.purchase = 90

  order.source = Station.all.shuffle[0]
  order.destination = Station.all.shuffle[1]
  order.save
end
