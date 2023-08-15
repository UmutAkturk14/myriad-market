class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
