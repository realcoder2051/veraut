class UserMailer < ApplicationMailer
 default :from => 'mohammad.haris@devbox.co'

  def welcome_email(name,title,phone,email)
    @name = name
    @title = title
    @phone = phone
    @email = email
    mail(:to => email, :subject => "Welcome to Veraut")
  end

end
