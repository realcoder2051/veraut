class UserMailer < ApplicationMailer
 default :from => 'hariszahid944@gmail.com'

  def welcome_email(user)
    @resource = user
    #@url  = "http://example.com/login"
    #mail :to => user.email, subject: "Welcome to My Awesome Site"
    mail(:to => @resource.email, :subject => "Welcome to My Awesome Site")
  end

end
