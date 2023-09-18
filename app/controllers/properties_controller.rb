class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @property = Property.find(params[:id])
    authorize @property
    @user = @property.user
    offer = Offer.find_by(offerable: @property)

    @markers =  [ lat: offer.latitude, lng: offer.longitude ]
  end

  def create
    p = Property.new(property_params)
    p.user = current_user
    authorize p
    if p.save!
      flash[:notice] = "You have successfully created a property"
      offer = Offer.new
      offer.user = current_user
      offer.offerable = p
      offer.up_for = "Not specified"
      offer.address = current_user.address || nil
      offer.title = v.description
      offer.visible = false
      offer.save!
      redirect_to user_profile_path(current_user)
    end
  end

  def destroy
    @posting = Property.find(params[:id])
    authorize @posting

    # Create the feed entry before destroying the @posting object
    Feed.create!(user: @posting.user, content: "removed posting P#{@posting.class.to_s[0]}##{@posting.id}.")
    Feed.where(offer: @posting).delete_all

    # Destroy the Offer associated with the @posting
    Offer.find_by(offerable: @posting).destroy

    if @posting.destroy
      flash[:notice] = "Posting has been successfully deleted."
      redirect_back(fallback_location: home_path)
    end
  end

  def activate
    @posting = Property.find(params[:id])
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

  def property_params
    params.require(:property).permit(:property_type, :bedrooms, :bathrooms, :square_feet, :age, :floor, :price, :address, :city, :state, :description, photos: [])
  end
end
