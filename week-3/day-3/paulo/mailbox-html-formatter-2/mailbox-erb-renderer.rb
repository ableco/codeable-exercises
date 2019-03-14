require "erb"

class MailboxErbRenderer
  attr_accessor :mailbox, :route
  def initialize(mailbox, route)
    @mailbox = mailbox
    @route = route
  end

  def render
    template = File.read(@route)
    return ERB.new(template).result(binding)
  end
end

class Email
  attr_accessor :subject ,:date ,:from
    def initialize(subject, date: , from:)
      @subject = subject
      @date = date
      @from = from
    end
end

class Mailbox
  attr_accessor :group, :emails
  def initialize(group, emails)
    @group = group
    @emails = emails
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