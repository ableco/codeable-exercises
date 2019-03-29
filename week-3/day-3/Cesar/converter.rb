require "erb"

class Email
  def initialize(subject, date:, from:)
    @subject = subject
    @date = date
    @from = from
  end
end

class Mailbox
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
        <tr>
          <td>2014-12-01</td>
          <td>Ferdous</td>
          <td>Homework this week</td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
"

html = ERB.new(template).result(binding)

puts html




# <% emails.each do |messages|
#     <tr>
#       <td> <%= Email.new(msg) %> </td>
#       <td> <%= Email.new(date) %> </td>
#       <td> <%= Email.new(from) %> </td>
#     </tr>
#   <% end > 