# Link: http://webapps-for-beginners.rubymonstas.org/exercises/mailbox_erb.html

# Instructions

Implement a class MailboxErbRenderer which takes a mailbox, and a filename to an ERB template:

class MailboxErbRenderer
-> fill in this class body
end

mailbox = Mailbox.new("Ruby Study Group", emails)
renderer = MailboxErbRenderer.new(mailbox, "mailbox.erb")
html = renderer.render

puts html
