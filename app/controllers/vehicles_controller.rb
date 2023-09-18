class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @vehicle = Vehicle.find(params[:id])
    authorize @vehicle
    @user = @vehicle.user
    offer = Offer.find_by(offerable: @vehicle)

    @markers =  [ lat: offer.latitude, lng: offer.longitude ]
  end

  def create
    v = Vehicle.new(vehicle_params)
    v.user = current_user
    authorize v
    if v.save!
      flash[:notice] = "You have successfully created the vehicle"
      offer = Offer.new
      offer.user = current_user
      offer.offerable = v
      offer.up_for = "Not specified"
      offer.address = current_user.address || nil
      offer.title = v.description
      offer.visible = false
      offer.save!
      redirect_to user_profile_path(current_user)
    end
  end

  def destroy
    @posting = Vehicle.find(params[:id])
    authorize @posting

    # Create the feed entry before destroying the @posting object
    Feed.create!(user: @posting.user, content: "removed posting V#{@posting.class.to_s[0]}##{@posting.id}.")
    Feed.where(offer: @posting).delete_all

    # Destroy the Offer associated with the @posting
    Offer.find_by(offerable: @posting).destroy

    if @posting.destroy
      flash[:notice] = "Posting has been successfully deleted."
      redirect_to user_profile_path(current_user)
    end
  end


  def activate
    @posting = Vehicle.find(params[:id])
    offer = Offer.find_by(offerable: @posting)
    authorize @posting

    if offer.visible == true
      offer.visible = false
    else
      offer.visible = true
    end
    if offer.save
      flash[:notice] = "Your posting status has been updated"
      redirect_back(fallback_location: home_path)
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :make, :model, :year, :mileage, :price, :fuel_type, :transmission, :description, photos: [])
  end
end
