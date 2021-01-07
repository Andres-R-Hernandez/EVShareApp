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

20.times do
    User.create(name: Faker::Name.name , age: Faker::Number.number(digits: 2), driver_id: Faker::IDNumber.valid, address: Faker::Address.full_address , email: Faker::Internet.email, password_digest: Faker::Lorem.paragraph)
end

20.times do
    CarModel.create(category: Faker::Vehicle.car_type, brand: Faker::Vehicle.make, model: Faker::Vehicle.model, description: Faker::Lorem.paragraphs, image_url: Faker::Avatar.image(slug: "my-own-slug",size: "50x50",format: "jpg"))
end

20.times do
    OwnedCar.create(year: Faker::Vehicle.year, price_per_day: Faker::Commerce.price, city: Faker::Address.city, car_model: CarModel.all.sample, user: User.all.sample)
end

20.times do
    Booking.create(owned_car: OwnedCar.all.sample, user: User.all.sample, pickup_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 14.day), dropoff_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 14.day))
end

20.times do
    Review.create(booking: Booking.all.sample, user: User.all.sample, description: Faker::Lorem.paragraphs, star_rating: rand(1..10))
end

20.times do
    WishListCar.create(car_model: CarModel.all.sample , user: User.all.sample)
end

puts "running seeds"
