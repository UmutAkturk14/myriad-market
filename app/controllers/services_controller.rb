class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @service = Service.find(params[:id])
    authorize @service
    @user = @service.user
    @offer = Offer.find_by(offerable: @service)

    @markers =  [ lat: @offer.latitude, lng: @offer.longitude ]
  end

  def create
    s = Service.new(service_params)
    s.user = current_user
    authorize s
    if s.save!
      flash[:notice] = "You have successfully created a service"
      offer = Offer.new
      offer.user = current_user
      offer.offerable = s
      offer.up_for = "Not specified"
      offer.address = current_user.address || nil
      offer.title = s.description
      offer.visible = false
      offer.save!
      redirect_to user_profile_path(current_user)
    end
  end

  def destroy
    @posting = Service.find(params[:id])
    authorize @posting

    # Create the feed entry before destroying the @posting object
    Feed.create!(user: @posting.user, content: "removed posting S#{@posting.class.to_s[0]}##{@posting.id}.")
    Feed.where(offer: @posting).delete_all

    # Destroy the Offer associated with the @posting
    Offer.find_by(offerable: @posting).destroy

    if @posting.destroy
      flash[:notice] = "Posting has been successfully deleted."
      redirect_back(fallback_location: home_path)
    end
  end

  def activate
    @posting = Service.find(params[:id])
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

  def service_params
    params.require(:service).permit(:service_type, :title, :hourly_rate, :location, :description, photos: [])
  end
end
