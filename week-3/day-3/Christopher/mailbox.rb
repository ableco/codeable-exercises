require "erb"

template="
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
  <h1><%= mailbox.title%></h1>
  <table>
    <thead>
      <tr>
        <th>Date</th>
        <th>From</th>
        <th>Subject</th>
      </tr>
    </thead>
    <tbody><%mailbox.emails.length.times do |i|%>
      <tr>
        <td><%= mailbox.emails[i].date %></td>
        <td><%= mailbox.emails[i].from %></td>
        <td><%= mailbox.emails[i].subject %></td>
      </tr><% end %>
    </tbody>
  </table>
</body>
</html>
  "

class Email
  attr_accessor :subject, :date, :from

  def initialize(subject, date:, from:)
    @subject = subject
    @date = date
    @from = from
  end
end

class Mailbox
  attr_accessor :title, :emails

  def initialize(title, emails)
    @title = title
    @emails = emails
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]

mailbox = Mailbox.new("Ruby Study Group", emails)


html = ERB.new(template).result(binding)
puts html

