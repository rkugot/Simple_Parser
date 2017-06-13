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

post '/save' do
	url = params[:url]
	product = Nokogiri::HTML(open(url))
	title = product.xpath('//*[@id="right"]/div/div[1]/div/h1/text()').text.strip
	labels = product.xpath("//ul[contains(@class,'attribute_labels_lists')]").length - 1
    pack = product.xpath("//span[contains(@class,'attribute_name')]")
    price = product.xpath("//span[contains(@class,'attribute_price')]")
    image = product.xpath("//img[contains(@id,'bigpic')]/@src")
	erb "You save #{url}, #{title}, #{labels}"
end