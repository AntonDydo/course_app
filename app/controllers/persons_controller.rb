class PersonsController < ApplicationController
before_action :set_user, only: %i[ profile]
  
  def profile
    current_user == nil ? nil : @reviews = @user.reviews.all
    current_user.admin? ? @users = User.all : @users = nil
  end

private

  def set_user
    @user = User.find(params[:id])
  end

end
