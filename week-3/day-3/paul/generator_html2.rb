class MailboxErbRenderer
  # fill in this class body
end

mailbox = Mailbox.new("Ruby Study Group", emails)
renderer = MailboxErbRenderer.new(mailbox, "mailbox.erb")
html = renderer.render

puts html