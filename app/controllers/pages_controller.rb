class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing, :vehicles, :properties, :services]

  def home
    @offers = Offer.all
  end

  def vehicles
    @offers = Offer.all
  end

  def properties
    @offers = Offer.all
  end

  def services
    @offers = Offer.all
  end

  def landing
    if current_user
      redirect_to home_path
    end
  end

  def chats

  end

  def hello

  end
end
