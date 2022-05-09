class PersonsController < ApplicationController
before_action :set_user


before_action :authenticate_user!
  
  def profile
    @reviews = @user.reviews.all.order('created_at DESC')
    @reviews_fav = @user.favorites.all.order('created_at DESC')
    current_user.admin? ? @users = User.all : @users = nil
  end



private

  def set_user
    @user = User.find(params[:id])
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end
end
