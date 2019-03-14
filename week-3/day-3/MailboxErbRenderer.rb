require "erb"
class MailboxErbRenderer
    # fill in this class body
    attr_accessor :mailbox, :archivo_name  
    def initialize(mailbox,archivo_name)
        #your code here
        @mailbox = mailbox
        @archivo_name = archivo_name
        
    end

    def render
         ERB.new(File.read(@archivo_name)).result(binding)
    end

end


class Email
    # your class from Ruby for Beginners, exercise 13.1
    attr_accessor :subject, :date, :from   
    def initialize(subject,date:,from:)
        #your code here
        @subject = subject
        @date = date
        @from = from
    end
end
  
class Mailbox
    # your class from Ruby for Beginners, exercise 13.1
    attr_accessor :title, :emails
    def initialize(title, emails)
        @title = title
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
  