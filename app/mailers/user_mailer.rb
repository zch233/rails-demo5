class UserMailer < ApplicationMailer
  default from: '529743595@qq.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
