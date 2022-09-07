class CampersController < ApplicationController
  def index
    render json: Camper.all
  end

  def show
    camper = Camper.find_by(id: params[:id])
    if !camper.nil?
      render json: camper, serializer: CamperWithActivitiesSerializer
    else
      render json: { error: "Camper not found" }
    end
  end

  def create
    camper = Camper.create!(camper_params)
    if !camper.nil?
      render json: camper
    else
      render json: { errors: camper.errors.full_messages }
    end
  end

  private

  def camper_params
    params.permit(:name, :age)
  end
end
