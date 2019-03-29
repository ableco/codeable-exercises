require "sinatra"
require "erb"

get "/home" do

    html = ERB.new(File.read("views/home.erb")).result(binding)
end

get "/home/:name" do
    # html = "<h1>Hello <%= params[:name] %>!</h1>"
    # ERB.new(html).result(binding)
    "Hello, I am Marieth! Faltan mas links"

  end
  

# get "/home/:name" do
#     "Hello #{params["name"]}!"
# end