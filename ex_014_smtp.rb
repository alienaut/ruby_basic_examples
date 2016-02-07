require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <info@forivia.com>
To: A Test User <yusufyalim@gmail.com>
MIME-Version: 1.0
Content-type: text/html
Subject: SMTP e-mail test

This is an e-mail message to be sent in HTML format

<b>This is HTML message.</b>
<h1>This is headline.</h1>
MESSAGE_END

m = Net::SMTP.new('mail.forivia.com', 587)
m.start('forivia.com', 'info@forivia.com', "Forforforivia!1", :login) do |smtp|
  smtp.send_message message, 'info@forivia.com', 'yusufyalim@gmail.com'
end
