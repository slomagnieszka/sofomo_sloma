module Api
  module V1
    class GeolocationsController < ApplicationController
      before_action :set_geolocation, only: [:show, :update, :destroy]

      def index
        @geolocations = Geolocation.all

        render json: @geolocations
      end

      def show
        render json: @geolocation
      end

      def create
        create_geolocation = Api::V1::Geolocations::Create.call(params: geolocation_params)
        if create_geolocation.success?
          render json: create_geolocation.result, status: :created, location: @geolocation
        else
          render json: create_geolocation.error, status: :unprocessable_entity
        end
      end

      private
        def set_geolocation
          @geolocation = Geolocation.find(params[:id])
        end

        def geolocation_params
          params.permit(:ip, :ip_type, :continent_code, :continent_name, :country_code, :country_name, :region_code, :region_name, :city, :zip, :latitude, :longitude, :geoname_id, :capital, :is_eu)
        end
    end
  end
end
