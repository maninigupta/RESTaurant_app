require 'bundler'
Bundler.require

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './connection.rb'
require './app'

namespace :db do
  desc "create restaurant_db database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE restaurant_db;')
    conn.close 
  end
  desc "drop restaurant_db database"
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE restaurant_db;')
    conn.close
  end

  desc "create junk data for development"
  task :junk_data do
    require './models/food'
    require './models/order'
    require './models/party'
    require './models/receipt'

    Food.create({name: 'Mac & Cheese', course: "Appetizer", price: 14.00})
    Food.create({name: 'Steak', course: "Main", price: 40.00})
    Food.create({name: 'Kale Salad', course: "Main", price: 35.00})
    Food.create({name: 'Chicken Noodle Soup', course: "Appetizer", price: 15.00})
    Food.create({name: 'Old Fashioned', course: "Drink", price: 7.50})
    Food.create({name: 'Fizzy Water', course: "Drink", price: 3.50})

    Party.create({table_num: 4,  guests: 3})
    Party.create({table_num: 9,  guests: 2})
    Party.create({table_num: 12, guests: 4})
    Party.create({table_num: 13, guests: 7})
    Party.create({table_num: 6,  guests: 2})
    Party.create({table_num: 11, guests: 3})
    Party.create({table_num: 18, guests: 1})
  
    parties = Party.all
    foods = Food.all
    
    parties.each do |party|
      party.guests.times do
        Order.create({party: party, food: foods.sample}) if [true, false].sample
      end
    end  
  end
end