require "erb"

template = "
<html>
  <body>
    <h1>List of Volunteers</h1>
    <table>
    <thead>
     <tr>
      <th>Name</th>
      <th>Email</th>
      <th>Mobile phone</th>
      <th>Languages</th>
      <th>Has car?</th>
    </tr>
    </thead>
    <tbody>
      <% volunteers.each do |message| %>
        <tr>
          <th><%=message[:first_name]%>  <%=message[:last_name]%></th>         
          <th><%=message[:email]%></th>
          <th><%=message[:mobile_phone]%></th>
          <th><%=message[:languages].join(', ')%></th>
          <th><% if message[:has_car] == true%>YES<%end%><% if message[:has_car] == false%>NO<%end%></th>
        </tr>       
      <% end %>
    </tbody>
    </table>
  </body>
</html>
"

volunteers = [
  {
    first_name: "John",
    last_name: "Smith",
    email: "john@smith.com",
    mobile_phone: 87384123,
    languages: ["English", "Spanish", "Germany"],
    has_car: true
  },
  {
    first_name: "Summer",
    last_name: "Stevens",
    email: "summer@stevens.com",
    mobile_phone: 987384123,
    languages: ["English", "Germany"],
    has_car: true
  },
  {
    first_name: "Zakary",
    last_name: "Brown",
    email: "zakary@brown.com",
    mobile_phone: 987384123,
    languages: ["Spanish"],
    has_car: false
  }
]

html = ERB.new(template).result(binding)
puts html
