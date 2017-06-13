#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:parses.db"

class Product < ActiveRecord::Base
end

get '/' do
	erb "Hello! Welcome to my simple parser"			
end