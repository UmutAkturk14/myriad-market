class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def home
    @offers = Offer.all
  end

  def landing
    # if current_user
    #   redirect_to home_path
    # end
  end
end
