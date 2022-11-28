class CampersController < ApplicationController
    # rescue method for not_found requests
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    # rescue method for uprocessable post
    rescue_from ActiveRecord::RecordInvalid, with: :render_uprocessable_entity 
    
    def index
        campers = Camper.all 
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, include: :activities
    end

    def create
        camper = Camper.create!(name: params[:name], age: params[:age])
        render json: camper, status: :created
    end

    private
    def render_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def render_uprocessable_entity
        render json: {error: ["validation errors"]}, status: :unprocessable_entity
    end
end
