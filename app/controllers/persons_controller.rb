class PersonsController < ApplicationController
  def profile
    @reviews = current_user.reviews.all
  end
end
