require "erb"

class Email
  def initialize(subject, headers)
    @subject = subject
    @headers = headers
  end

  def subject
    @subject
  end

  def date
    @headers[:date]
  end

  def from
    @headers[:from]
  end
end

class Mailbox
  def initialize(name, emails)
    @name = name
    @emails = emails
  end

  def name
    @name
  end

  def emails
    @emails
  end
end

class MailboxErbRenderer
  def initialize(mailbox, filename)
    @mailbox = mailbox
    @filename = filename
  end

  def render
    # imaginary save file
    File.open(@filename, "w") do |file|
      file.write(@mailbox)
    end
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]



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
    <h1><%= mailbox.name %></h1>
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
mailbox = Mailbox.new("Ruby Study Group", emails)

renderer = MailboxErbRenderer.new(mailbox, "mailbox.erb")
html = renderer.render

puts html