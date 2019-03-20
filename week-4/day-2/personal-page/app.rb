require "sinatra"
require "erb"
# + '/assets'
path = File.dirname(__FILE__)
set :public_folder, path


get "/" do
    erb :hello
end



