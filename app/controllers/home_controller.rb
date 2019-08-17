class HomeController < ApplicationController
  def index
  end

  def accept
    user&.accept!

    redirect_to :root
  end

  def reject
    user&.reject!

    redirect_to :root
  end

  def restaurant
    if user
      group = ::Event.order(:created_at).last.groups.find_by(leader: user)
      group&.select_restaurant(params[:restaurant])
    end

    redirect_to :root
  end

  private

  def user
    @user ||= ::User.find_by(token: params[:token])
  end
end
