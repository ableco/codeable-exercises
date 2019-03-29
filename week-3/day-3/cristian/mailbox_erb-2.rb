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
  attr_accessor :name, :emails
  def initialize(name, emails)
    @name = name
    @emails = emails
  end
end

class MailboxErbRenderer
  attr_accessor :mailbox, :filename
  def initialize(mailbox, filename)
    @mailbox = mailbox
    @filename = filename
  end

  def render
    template = File.read(@filename)
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
$html = renderer.render

def save_html
  File.open("mailbox.html","w") do |file|
    file.write($html)
  end
end

save_html

puts $html