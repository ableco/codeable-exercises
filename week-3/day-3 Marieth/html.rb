require "erb"

template = "
<html>
  <body>
    <h1>Hi  <%= name %>, you have those messages:</h1>
    <ul>
      <% messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </body>
</html>
"

name = "Kattya"
messages = ["Meeting tonight!", "It's lunchtime"]

html = ERB.new(template).result(binding)
puts html

