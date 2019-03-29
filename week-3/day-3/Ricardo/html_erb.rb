require "erb"

class Email
  attr_accessor :str, :date, :from
  def initialize(str, date:, from:)
    @str = str
    @date = date
    @from = from
  end

end

class Mailbox
  attr_accessor :str, :emails
  def initialize(str, emails)
    @str = str
    @emails = emails
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]
mailbox = Mailbox.new("Ruby Study Group", emails)


template = "
<html>
  <head>
    <style>
      table {
        border-collapse: collapse;
      }
      td, th {
        border: 1px solid black;
        padding: 1em;
      }
    </style>
  </head>
  <body>
    <h1><%= mailbox.str %></h1>
    <table>
      <thead>
        <tr>
          <th>Date</th>
          <th>From</th>
          <th>Subject</th>
        </tr>
      </thead>
      <tbody>
        <% mailbox.emails.each do |email| %>
          <tr>
            <td><%= email.date %></td>
            <td><%= email.from %></td>
            <td><%= email.str %></td>
          <tr>
        <% end %>
      </tbody>
    </table>
  </body>
</html>
"

html = ERB.new(template).result(binding)

puts html