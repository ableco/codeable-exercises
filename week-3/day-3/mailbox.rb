require "erb"

class Email
    def initialize(subject, details)
        @subject = subject
        @details = details
      end
    
      def subject
        @subject
      end
    
      def date
        @details[:date]
      end
    
      def from
        @details[:from]
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

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]
mailbox = Mailbox.new("Ruby Study Group", emails)

html1 = "
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
      <% emails.each do |x| %>
      <tr>
        <td><%= x.date %></td>
        <td><%= x.from%></td>
        <td><%= x.subject %></td>
      </tr>
      <% end %>
    </tbody>
  </table>
</body>
</html>
"
html = ERB.new(html1).result(binding)
puts html


#3.2 MISSING 