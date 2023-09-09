class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @property = Property.find(params[:id])
    authorize @property
    @user = @property.user
    offer = Offer.find_by(offerable: @property)

    @markers =  [ lat: offer.latitude, lng: offer.longitude ]
  end

  def destroy
    raise
  end

  def activate
    raise
  end
end
