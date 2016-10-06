class UserMailer < ActionMailer::Base
  default from: "everybody@appacademy.io"
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/cats'
    mail(to: user.username, subject: 'Welcome to My Awesome Site')
  end
end
