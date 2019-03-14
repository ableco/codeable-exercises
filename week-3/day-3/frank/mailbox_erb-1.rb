require "erb"

class Email
  attr_accessor :subject, :date, :from
  def initialize(subject, date:, from:)
    @subject = subject
    @date = date
    @from = from
  end
end

class Mailbox

  @@template = "
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
        <h1><%= @title %></h1>
        <table>
          <thead>
            <tr>
              <th>Date</th>
              <th>From</th>
              <th>Subject</th>
            </tr>
          </thead>
          <tbody>
            <% @emails.each do |email| %>
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
  def initialize(title, emails)
    @title = title
    @emails = emails
  end

  def to_html
    ERB.new(@@template).result(binding)
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]
mailbox = Mailbox.new("Ruby Study Group", emails)

html = mailbox.to_html

puts html
