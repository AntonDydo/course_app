class PersonsController < ApplicationController
  def profile
    current_user == nil ? nil : @reviews = current_user.reviews.all
  end
end
