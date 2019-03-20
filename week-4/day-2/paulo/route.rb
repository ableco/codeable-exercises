require "sinatra"
require "erb"

get "/" do
  erb :index
end

get "/intro" do
  erb :intro
end

get "/about" do
  erb :about
end

get "/work" do
  erb :work
end

get "/blog" do
  erb :blog
end

get "/contact" do
  erb :contact
end

set :port,8006