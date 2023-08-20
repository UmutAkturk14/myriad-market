class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user

    @offers = Offer.where(user: @user)
  end
end
