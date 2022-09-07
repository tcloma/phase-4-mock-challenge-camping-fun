class ActivitiesController < ApplicationController

  def index
    render json: Activity.all
  end

  def destroy
    activity = Activity.find_by(id: params[:id])
    if !activity.is_a?(NilClass)
      activity.signups.destroy_all
      activity.destroy
    else
      render json: { error: "Activity not found" }
    end
  end

end
