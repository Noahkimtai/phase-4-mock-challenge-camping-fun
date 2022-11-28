class SignupsController < ApplicationController
    # rescue for invalid post requests
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_errors

    def show
        signup = Signup.find(params[:id])
        render json: signup
    end
    
    def create
        signup = Signup.create(camper_id: params[:camper_id], 
            activity_id: params[:activity_id],
             time: params[:time])
        render json: signup, status: :created
    end

    private
    def render_validation_errors
        render json: {error: ["validation errors"]}, status: :unprocessable_entity
    end
end
