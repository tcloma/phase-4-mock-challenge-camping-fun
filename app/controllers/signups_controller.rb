class SignupsController < ApplicationController

  def create
    signup = Signup.new(activity_params)
    if !signup.is_a?(NilClass)
      signup.save
      render json: signup.activity
    else
      render json: { errors: signup.errors.full_messages}
    end
  end

  private

  def activity_params
    params.permit(:time, :camper_id, :activity_id)
  end

end
