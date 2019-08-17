class UserMailer < ApplicationMailer
  def confirm(user, event)
    @user = user

    mail(to: @user.email, subject: 'Will you go with us?')
  end
end
