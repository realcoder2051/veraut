class UserMailer < ApplicationMailer
  default :from => 'mohammad.haris@devbox.co'

  def welcome_email(email)
    # @name = name
    # @title = title
    # @description = phone
    @email = email[:email]

    #@url  = "http://example.com/login"
    #mail :to => user.email, subject: "Welcome to My Awesome Site"
    mail(:to => email[:email], :subject => "Welcome to My Awesome Site")
  end

end
