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
Location.destroy_all
User.destroy_all

user = User.create(email: 'test@test.co', password: 'test123', first_name: 'Tess', last_name: 'Est')

def trueFalse
   rand(0..100) >= 50
end

def hourly_rate
  rand(100..1000)
end


puts "------------seeding-----------"
10.times do
  attributes = {
    name: Faker::Cannabis.brand,
    address: Faker::Address.full_address,
    hourly_rate: hourly_rate,
    photo: 'https://source.unsplash.com/random',
    start_date: Date.today.to_s,
    end_date: (Date.today + rand(10..50)).to_s,
    description: Faker::LoremFlickr.image(size: "300x300", search_terms: ['view']),
    commercial_use: trueFalse,
    monument: trueFalse,
    landscape: trueFalse,
    user_id: user.id
  }
  Location.create(attributes)
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



