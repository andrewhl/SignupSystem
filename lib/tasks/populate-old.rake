# namespace :db do
#   desc "Erase and fill database"
#   task :populate => :environment do
#     require 'populator'
#     require 'faker'
#     
#     [User].each(&:delete_all)
#     
#     
#     User.populate 100 do |user|
#       user.first_name    = Faker::Name.first_name
#       user.last_name     = Faker::Name.last_name
#       user.email   = Faker::Internet.email
#       user.mother_first_name = user.first_name
#       user.mother_last_name  = user.last_name
#       user.father_first_name = Faker::Name.first_name
#       user.father_last_name  = user.last_name
#       user.father_email      = Faker::Internet.email
#       user.mother_home_phone   = Faker::PhoneNumber.phone_number
#       user.mother_work_phone   = Faker::PhoneNumber.phone_number
#       user.father_work_phone   = Faker::PhoneNumber.phone_number
#       user.address  = Faker::Address.street_address
#       user.city    = Faker::Address.city
#       user.postal_code     = Faker::Address.uk_postcode
#     end
#   end
# end