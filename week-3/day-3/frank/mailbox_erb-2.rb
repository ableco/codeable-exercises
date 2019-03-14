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
  attr_accessor :title, :emails
  def initialize(title, emails)
    @title = title
    @emails = emails
  end
end

class MailboxErbRenderer
  def initialize(mailbox, file)
    @mailbox = mailbox
    @file = file
  end

  def render
    template = File.read(@file)
    ERB.new(template).result(binding)
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]

mailbox = Mailbox.new("Ruby Study Group", emails)

renderer = MailboxErbRenderer.new(mailbox, "mailbox.erb")

html = renderer.render

puts html
