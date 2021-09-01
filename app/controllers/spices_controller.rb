class SpicesController < ApplicationController

    def index
        render json: Spice.all, status: :ok
    end

    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice, status: :created
    end

    def update
        find_spice = Spice.find_by(id: params[:id])
        find_spice.update(spice_params)
        render json: find_spice, status: :accepted
    end

    def destroy
        find_spice = Spice.find_by(id: params[:id])
        find_spice.destroy
        render json: find_spice
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end

