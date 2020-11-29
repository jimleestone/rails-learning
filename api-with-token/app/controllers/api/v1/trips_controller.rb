module Api
  module V1
    class TripsController < ApplicationController
      include JwtAuthenticator
      before_action :jwt_authenticate

      def index
        trips = Trip.all
        trips = trips.map do |trip|
          { id: trip.id, name: trip.name }
        end

        render json: { results: trips }.to_json, status: :ok
      end
    end
  end
end
