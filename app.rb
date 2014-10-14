require 'bundler'
Bundler.require

require './models/food'
require './models/order'
require './models/party'

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'restaurant_db'
	})

get '/foods' do
	@foods = Food.all
	erb :'foods/index'
end 

get '/foods/new' do
	erb :'foods/new'
end

post '/foods/' do
	Food.create(params[:food])
	redirect '/foods'
end

get '/foods/:id' do
	@food = Food.find(params[:id])
	erb :'foods/show'
end

get '/foods/:id/edit' do
	@food = Food.find(params[:edit])
	erb :'foods/edit'
end

patch '/foods/:id' do
	food = Food.find(params[:id])
	food.name = params[:food][:name]
	food.price = params[:food][:price]
	food.course = params[:food][:course]
	food.any_allergens = params[:food][:any_allergens]
	food.save
	redirect '/foods/:id'
end

delete '/foods/:id' do
	Food.delete(params[:id])
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
	redirect '/parties/:id'
end

delete '/parties/:id' do
	Party.delete(params[:id])
	redirect '/parties'
end
end