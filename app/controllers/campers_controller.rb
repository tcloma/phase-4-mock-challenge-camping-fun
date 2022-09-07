class CampersController < ApplicationController
  def index
    render json: Camper.all
  end

  def show
    camper = Camper.find_by(id: params[:id])
    if !camper.is_a?(NilClass)
      render json: camper, serializer: CamperWithActivitiesSerializer
    else
      render json: { error: "Camper not found" }
    end
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper
  end

  private

  def camper_params
    params.permit(:name, :age)
  end
end
