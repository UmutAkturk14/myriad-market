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

  def search
    if params[:search].present?
      @results = Offer.search_by_title_and_synopsis(params[:search][:query])
    end
  end
end
