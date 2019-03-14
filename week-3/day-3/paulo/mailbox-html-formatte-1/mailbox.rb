require "erb"

class Email
  attr_accessor :subject ,:date ,:from
    def initialize(subject, date: , from:)
      @subject = subject
      @date = date
      @from = from
    end
end

class Mailbox
  attr_accessor :group, :emails
  def initialize(group, emails)
    @group = group
    @emails = emails
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]

mailbox = Mailbox.new("Ruby Study Group", emails)

# puts mailbox.group
# puts mailbox.emails[0].subject
# puts emails[0].subject
# puts emails[0].date
# puts emails[0].from

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
    <h1><%= mailbox.group %></h1>
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
</html>"

html = ERB.new(template).result(binding)

puts html