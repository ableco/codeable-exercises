require "erb"
require "./model/team_members.rb"

def controller

  title = "PATRICIA"
  template = File.read("./team_member.erb")

  html = ERB.new(template).result(binding)

  puts html
end

controller