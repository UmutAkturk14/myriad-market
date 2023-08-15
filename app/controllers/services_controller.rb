class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @service = Service.find(params[:id])
  end
end
