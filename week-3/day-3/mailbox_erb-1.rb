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
    <h1><% Mailbox.name %></h1>
    <table>
      <thead>
        <tr>
          <th>Date</th>
          <th>From</th>
          <th>Subject</th>
        </tr>
      </thead>
      <tbody>
        <% emails.each do |email| %>
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
html = ERB.new(template).result(binding)
puts html