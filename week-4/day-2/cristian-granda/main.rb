require "sinatra"
require "erb"
require "sinatra/reloader"
# require_relative "projects_data"



puts "http://localhost:#{settings.port} 🚀"

get '/' do
  redirect '/index'
end

get "/index" do
  @projects = [
    {
      :project_title => "Sketch Fight",
      :project_content => "A mobile game where you have to survive waves of enemies",
      :project_url => "http://onelink.to/sketchfight"
    },
    {
      :project_title => "Terggia",
      :project_content => "An adventure game",
      :project_url => "https://heatwavegames.itch.io/terggia"
    },
    {
      :project_title => "Castle Outlaws",
      :project_content => "An adventure game",
      :project_url => "https://pinkpotato.itch.io/castle-outlaws"
    },
    {
      :project_title => "Bembos Pong Game",
      :project_content => "Just a regular pong game",
      :project_url => "https://cristianbgp.github.io/BembosPongGame/"
    }
  ]
  erb :index 
end

