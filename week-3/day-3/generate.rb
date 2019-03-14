require 'erb'

class Email
  attr_accessor(:subject ,:date ,:from)
  def initialize(subject, date: , from: )
  @subject = subject
  @date = date
  @from = from
  end
end

class Mailbox
  attr_accessor(:group, :elements)
  def initialize(group,elements)
    @group = group
    @elements = elements
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]

mailbox = Mailbox.new("Ruby Study Group", emails)

# --------------------------------
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
    <h1>Ruby Study Group</h1>
    <table>

      <thead>
        <tr>
          <th>Date</th>
          <th>From</th>
          <th>Subject</th>
        </tr>
      </thead>

      <tbody>
        <% emails.each do |x|%>
          <tr>
            <td> <%= x.date  %> </td>
            <td><%= x.from %></td>
            <td> <%= x.subject %> </td>
          </tr>
        <% end %>
      </tbody>

    </table>
  </body>
</html>
"
html = ERB.new(template).result(binding)
puts html

