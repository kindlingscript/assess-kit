class NotificationMailer < ActionMailer::Base
  default from: "no-reply@assesskitapp.com"

  def comment_added
  	mail(to: "inflamedmuse@gmail.com",
  		subject: "A comment has been added to your place!")
  end
end
