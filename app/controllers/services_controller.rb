class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @service = Service.find(params[:id])
    authorize @service
    @offer = Offer.find_by(offerable: @service)

    @markers =  [ lat: @offer.latitude, lng: @offer.longitude ]
  end
end
