#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'nokogiri'
require 'open-uri'

set :database, "sqlite3:parser.db"

class Product < ActiveRecord::Base
end

get '/' do
	erb "Welcome to simple parser"			
end

get '/save' do
	erb :save
end

get '/products' do
	erb :products
end

post '/products' do
	@product = Product.where("title = ?",params[:product])
	erb :products_list
end

post '/save' do
	url = params[:url]
	item = Nokogiri::HTML(open(url))
	title = item.xpath('//*[@id="right"]/div/div[1]/div/h1/text()').text.strip
	labels = item.xpath("//ul[contains(@class,'attribute_labels_lists')]").length - 1
    pack = item.xpath("//span[contains(@class,'attribute_name')]")
    price = item.xpath("//span[contains(@class,'attribute_price')]")
    image = item.xpath("//img[contains(@id,'bigpic')]/@src")
    for i in 0..labels do
		weight = pack[i].text.split(' ')
		pr = price[i].text.split(' ')
		product = Product.create(title: title, pack: weight[0].to_f, price: pr[0].to_f, image: image)
	end
	erb "Your product is save"
end