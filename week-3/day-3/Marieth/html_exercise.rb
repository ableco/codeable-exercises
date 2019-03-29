require "erb"



  template = "
  <html>
    <body>
      <h1>List of volunteers:</h1>
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
      <tbody><% volunteers.each do |volunteer| %>
            <tr>
            <th><%= volunteer[:first_name]%>,<th>
            <th><%= volunteer[:last_name] %>,<th>
            <th><%= volunteer[:email]%>,<th>
            <th><%= volunteer[:mobile_phone]%>,<th>
            <th><%= volunteer[:languages].join(', ')%>,<th>
            <th><%= volunteer[:has_car]? 'Yes':'No' %><th>
            </tr><% end %>
      </tbody>
    </table>
  </body>
</html>
  "
  
#   name = "Kattya"
#   messages = ["Meeting tonight!", "It's lunchtime"]

  volunteers = [
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
  