class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = User.friendly.find(params[:id])
    authorize @user
    if @user == current_user
      @ownership = Vehicle.where(user: current_user) + Property.where(user: current_user) + Service.where(user: current_user)
    end

    @offers = @user == current_user ? Offer.where(user: @user) : Offer.where(user: @user, visible: true)
  end

  def update
    @user = User.friendly.find(params[:id])
    authorize @user
    if @user.update(user_params)
      # Feed.create!(user: @user, content: "Profile informations changed.")
      flash[:notice] = "Your profile has been updated"
      redirect_back(fallback_location: home_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :full_name, :username, :phone_number, :address, :country, :city, :about, :phone_number_visible, :account_type, :address_visible, :profile_photo, :email_visible)
  end
end
