require 'bundler'
Bundler.require

require './models/food'
require './models/order'
require './models/party'

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'restaurant_db'
  })

get '/' do
  redirect '/parties'
end

get '/foods' do
  @foods = Food.all
  erb :'foods/index'
end 

get '/foods/new' do
  erb :'foods/new'
end

post '/foods' do
  Food.create(params[:food])
  redirect '/foods'
end

get '/foods/:id' do
  @food = Food.find(params[:id])
  erb :'foods/show'
end

get '/foods/:id/edit' do
  @food = Food.find(params[:id])
  erb :'foods/edit'
end

patch '/foods/:id' do
  food = Food.find(params[:id])
  food.name = params[:food][:name]
  food.price = params[:food][:price]
  food.course = params[:food][:course]
  food.any_allergens = params[:food][:any_allergens]
  food.save
  redirect '/foods'
end

delete '/foods/:id' do
  food = Food.find(params[:id])
  food.destroy
  redirect '/foods'
end

get '/parties' do
  @parties = Party.all
  erb :'parties/index'
end

get '/parties/new' do
  erb :'parties/new'
end

post '/parties' do
  Party.create(params[:party])
  redirect '/parties'
end

get '/parties/:id' do
  @party = Party.find(params[:id])
  @foods = Food.all
  erb :'parties/show'
end

get '/parties/:id/edit' do
  @party = Party.find(params[:id])
  erb :'parties/edit'
end

patch '/parties/:id' do
  party = Party.find(params[:id])
  party.table_num = params[:party][:table_num]
  party.guests = params[:party][:guests]
  party.payment_complete = params[:party][:payment_complete]
  party.save
  redirect "/parties/#{party.id}"
end

delete '/parties/:id' do
  Party.delete(params[:id])
  redirect '/parties'
end

# Orders Code!

post '/orders' do
  # party = Party.find(params[:party_id])
 #  food = Food.find(params[:food_id])  
  # party.foods << food

  Order.create(
    party_id: params[:party_id],
    food_id: params[:food_id]
    )

  redirect "/parties/#{params[:party_id]}"
end

delete '/orders/:id' do
  Order.destroy(params[:id])
  redirect "/parties/#{params[:party_id]}"
end
