# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
CarModel.destroy_all
OwnedCar.destroy_all
Review.destroy_all
User.destroy_all
WishListCar.destroy_all

10.times do 
    Booking.create(car_model_id: CarModel.all.sample, user_id: User.all.sample, booking_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now))
end 

10.times do
    CarModel.create(brand: Faker::Vehicle.make, model: Faker::Vehicle.model, description: Faker::Lorem.paragraphs, image_url: Faker::Avatar.image("my-own-slug", "50x50", "jpg"))
end 

10.times do
    OwnedCar.create(year: Faker::Vehicle.year, price_per_day: Faker::Commerce.price, city: Faker::Address.city, car_model_id: CarModel.all.sample, user_id: User.all.sample)
end 

10.times do
    Review.create(booking_id: Booking.all.sample, user_id: User.all.sample, description: Faker::Lorem.paragraphs, star_rating: Faker::Number.decimal(l_digits: 2))
end 

10.times do
    User.create(name: Faker::Name.name , age: Faker::Number.number(digits: 2), driver_id: Faker::IDNumber.valid, address: Faker::Address.full_address , email: Faker::Internet.email , password_digest: Faker::Lorem.paragraphs)
end 

10.times do
    WishListCar.create(car_model_id: CarModel.all.sample , user_id: User.all.sample)
end 

puts "running seeds"
