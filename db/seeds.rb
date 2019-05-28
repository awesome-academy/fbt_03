User.create!(name:  "Phan Thanh Dong",
 email: "phanthanhdong@gmail.com",
 password: "123456789",
 password_confirmation: "123456789",
 address: "Binh Dinh"
 phone: "0961141478",
 role: 1,
 activated: true)

3.times do |n|
  Category.create!(name: Faker::Name.name,
                 description: Faker::Lorem.sentence)
end
get_all_categories_id = Category.pluck(:id)
12.times do |n|
  TourDetail.create!(name: Faker::Name.name,
               duration: "3 ngày 2 đêm",
               information: Faker::Lorem.sentence,
               average_ratting: 3.0,
               category_id:  get_all_categories_id.sample)
end
get_all_tour_details = TourDetail.pluck(:id)
12.times do |n|
  Tour.create!(start_date: Faker::Time.forward(23, :morning),
               price: Faker::Commerce.price,
               tour_detail_id: get_all_tour_details.sample)
end
