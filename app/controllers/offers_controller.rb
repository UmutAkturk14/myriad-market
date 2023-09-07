class OffersController < ApplicationController
  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer

    if @offer.destroy
      flash[:notice] = "Your offer has been deleted"
      redirect_to user_profile_path(current_user)
    end
  end
end
