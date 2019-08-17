class HomeController < ApplicationController
  def index
  end

  def accept
    user = ::User.find_by(token: params[:token])
    user&.accept!

    redirect_to :root
  end

  def reject
    user = ::User.find_by(token: params[:token])
    user&.reject!

    redirect_to :root
  end
end
