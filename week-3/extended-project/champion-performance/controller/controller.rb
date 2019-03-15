require "json"
require "erb"

title = "patricia"

def controller(person)
  # get json data
  data = File.open("./model/team_members.json")
  data_team_members = ""
  data.each { |x| data_team_members << x }
  data.close
  data_team_members = JSON.parse(data_team_members)

  # creating accesible variables
  name = data_team_members[person]["name"]
  team = data_team_members[person]["team"]
  introduction = data_team_members[person]["introduction"]

  # get file template
  template = File.read("./templates/team_member.erb")

  # get html
  html = ERB.new(template).result(binding)
end

controller("paul")
