class LeaderMailer < ApplicationMailer
  def notification(user, group)
    @user = user
    @group = group
    @restaurants = ['Mc Donalds', 'KFC']

    mail(to: @user.email, subject: 'Please select a restaurant')
  end
end
