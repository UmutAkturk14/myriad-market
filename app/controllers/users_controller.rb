class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    authorize @user

    @offers = Offer.where(user: @user)
  end

  def update
    @user = User.friendly.find(params[:id])
    authorize @user
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated"
      redirect_back(fallback_location: home_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :full_name, :username, :phone_number, :address, :country, :city, :about, :phone_number_visible, :account_type, :address_visible, :profile_photo)
  end
end
