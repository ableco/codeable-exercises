require 'sinatra'
require 'erb'
require 'sinatra/reloader'

get "/home" do
    erb :home
end

get "/about_me" do
    erb :about_me
end

get "/more" do
    erb :more
end

set :port, 8000