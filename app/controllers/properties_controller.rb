class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @property = Property.find(params[:id])
  end
end
