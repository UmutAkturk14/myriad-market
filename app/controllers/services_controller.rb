class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @service = Service.find(params[:id])
    authorize @service
    @user = @service.user
    @offer = Offer.find_by(offerable: @service)

    @markers =  [ lat: @offer.latitude, lng: @offer.longitude ]
  end

  def destroy
    raise
  end

  def activate
    raise
  end
end
