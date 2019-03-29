require "erb"

class Email
  attr_accessor :subject, :date, :from
  def initialize(subject, headers)
    @subject = subject
    @date = headers[:date]
    @from = headers[:from]
  end
end

class Mailbox
  attr_accessor :tittle, :emails
  def initialize(tittle, emails)
    @tittle = tittle
    @emails = emails
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]

mailbox = Mailbox.new("Ruby Study Group", emails)

# puts mailbox.emails[0].subject

html = "
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
    <h1><%= mailbox.tittle %></h1>
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
          <td><%= email.subject %></td>
        </tr>
        <% end %>
      </tbody>
    </table>
  </body>
</html>
"
html = ERB.new(html).result(binding)
puts html