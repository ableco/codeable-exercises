require "sinatra"
require "erb"

get "/" do
    erb :home
end

get "/about-me" do
    erb :me
end

get "/contact" do
    erb :contact
end

get "/goals" do
    erb :goals
end