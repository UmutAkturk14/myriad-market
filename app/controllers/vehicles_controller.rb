class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @vehicle = Vehicle.find(params[:id])
    authorize @vehicle
    @user = @vehicle.user
    offer = Offer.find_by(offerable: @vehicle)

    @markers =  [ lat: offer.latitude, lng: offer.longitude ]
  end
end
