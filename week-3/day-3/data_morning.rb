# Sorry this exercise was a sample from morning shift
#
volunteers = [
  {
    first_name: "John",
    last_name: "Smith",
    mobile_phone: 987384123,
    languages: ["English", "Spanish", "Germany"],
    has_car: true
  },
  {
    first_name: "Summer",
    last_name: "Stevens",
    mobile_phone: 987384123,
    languages: ["English", "Germany"],
    has_car: true
  },
  {
    first_name: "Zakary",
    last_name: "Brown",
    mobile_phone: 987384123,
    languages: ["Spanish"],
    has_car: false
  }
]

require "erb"

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
        <% volunteers.each do |hash| %>
          
        <tr>
          <th> <%= hash[:first_name] + ' ' + hash[:last_name] %> </th>
          <th> <%= hash[:last_name]%> </th>
          <th> <%= hash[:mobile_phone]%> </th>
          <th> <%= hash[:languages].join(' ')%> </th>
          <th> <%= hash[:has_car]? 'Yes':'No' %> </th>
        </tr>
      <% end %>

      </tbody>
    </table>
  </body>
</html>
"

html = ERB.new(template).result(binding)
puts html



