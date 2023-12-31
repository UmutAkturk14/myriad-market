class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @offer.user = current_user
    authorize @offer
  end

  def create
    # TODO:
    raise
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer

    if @offer.destroy
      flash[:notice] = "Your offer has been deleted"
      redirect_to user_profile_path(current_user)
    end
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer

    if @offer.update(offer_params)
      flash[:notice] = "Your offer has been updated"
      redirect_to user_profile_path(current_user)
    end
  end

  def fetch_form
    @offer = Offer.new(user: current_user)
    authorize :offer
    render partial: "shared/new_offer_form", layout: false
  end

  private
  # TODO: Need to finish this
  def offer_params
    params.require(:offer).permit(:up_for, :title, :address)
  end
end
