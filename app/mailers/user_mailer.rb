class UserMailer < ApplicationMailer
  def confirm(user, event)
    @user = user

    mail(to: @user.email, subject: 'Will you go with us?')
  end

  def notification(user, group)
    @user = user
    @group = group

    mail(to: @user.email, subject: 'Restaurant has been selected!')
  end
end
