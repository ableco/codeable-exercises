# Link: http://webapps-for-beginners.rubymonstas.org/exercises/mailbox_erb.html

# Instructions

With what you’ve learned from the Embedded Ruby chapter, your goal now is to generate the same HTML as in the exercise The Mailbox Html Formatter - except that you now use ERB for generating the HTML, not the MailboxHtmlFormatter class.

Make a new file mailbox.rb and add the following code:

require "erb"

class Email

->your class from Ruby for Beginners

end

class Mailbox

-> your class from Ruby for Beginners

end

emails = [
Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]
mailbox = Mailbox.new("Ruby Study Group", emails)

html = # complete this code ...

puts html

Now complete it so that it outputs exactly the same HTML code as in Ruby for Beginners:

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
        <tr>
          <td>2014-12-01</td>
          <td>Dajana</td>
          <td>Keep on coding! :)</td>
        </tr>
        <tr>
          <td>2014-12-02</td>
          <td>Ariane</td>
          <td>Re: Homework this week</td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
