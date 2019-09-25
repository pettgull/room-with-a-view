# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


puts "user count  = #{User.count}"
puts "Location count  = #{Location.count}"
puts '---------deleting all records---------------'
Booking.destroy_all
Location.destroy_all
User.destroy_all

pictures = ['https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412062/andre-benz-RAXQkgmyrcA-unsplash_jwbjde.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412063/rooms-with-amazing-view-38__880_i4gabh.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412063/Room_with_a_view_Sentosa_qa9ecy.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412063/picture_of_a_hut_befc3f.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412063/marine-fishingboats-ireland_phwk52.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412062/justaview_pblqf7.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412062/hernan-sanchez-kEFrAFKY6Sk-unsplash_q7n2be.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412062/jeremystoweroflove_xd1y8c.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412062/hello-lightbulb-YC8qqp50BdA-unsplash_azm5hi.jpg',
            'https://res.cloudinary.com/dswkxjcbj/image/upload/v1569412061/fishingboats_zekp3o.jpg'
]

def trueFalse
   rand(0..100) >= 50
end

def hourly_rate
  rand(100..1000)
end

counter = 0

puts "------------seeding-----------"
user = User.create(email: 'test@test.co', password: 'test123', first_name: 'Tess', last_name: 'Est', phone_number: '123456788', description: 'smooth slick and silky')
10.times do
  attributes = {
    name: Faker::Cannabis.brand,
    address: Faker::Address.full_address,
    hourly_rate: hourly_rate,
    photo: pictures[counter],
    start_date: Date.today.to_s,
    end_date: (Date.today + rand(10..50)).to_s,
    description: Faker::LoremFlickr.image(size: "300x300", search_terms: ['view']),
    commercial_use: trueFalse,
    monument: trueFalse,
    landscape: trueFalse,
    user_id: user.id
  }
  Location.create(attributes)
  counter += 1
  puts counter
end

puts "---------seeding done--------"
puts "user count  = #{User.count}"
puts "Location count  = #{Location.count}"



 # t.string "name"
 #    t.string "address"
 #    t.integer "hourly_rate"
 #    t.string "photo"
 #    t.date "start_date"
 #    t.date "end_date"
 #    t.text "description"
 #    t.boolean "commercial_use"
 #    t.boolean "monument"
 #    t.boolean "landscape"
 #    t.bigint "user_id"
 #    t.datetime "created_at", null: false
 #    t.datetime "updated_at", null: false
 #    t.index ["user_id"], name: "index_locations_on_user_id"



