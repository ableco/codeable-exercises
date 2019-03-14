require 'erb'

template = "
<html>
  <body>
    <h1>List of volunteers</h1>
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
      <% data.each do |volunteer| %>
        <tr>
          <td><%= volunteer[:first_name] + ' ' + volunteer[:last_name] %></td>
          <td><%= volunteer[:email] %></td>
          <td><%= volunteer[:mobile_phone] %></td>
          <td><%= volunteer[:languages].join(', ') %></td>
          <td><%= volunteer[:has_car] ? 'yes' : 'no' %></td>
        </tr>
      <% end %>
      </tbody>
    </table>
  </body>
</html>
"
data = [
  {
    first_name: "John",
    last_name: "Smith",
    email: "john@smith.com",
    mobile_phone: 987384123,
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
