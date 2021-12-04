# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:email => 'dydo00@bk.ru', :password => '123456', :password_confirmation => '123456', :admin => true)
User.create(:email => 'dydo01@bk.ru', :password => '123456', :password_confirmation => '123456', :admin => false)
User.create(:email => 'dydo02@bk.ru', :password => '123456', :password_confirmation => '123456', :admin => false)