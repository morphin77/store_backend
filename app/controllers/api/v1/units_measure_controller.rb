module Api
  module V1
    class UnitsMeasureController < ApplicationController
      before_action :authorize_request

      def index

        @unit_measures = UnitMeasure.all
        render json: current_user
      end

      def new
      end

      def create

      end

      def show
      end

      def delete
      end
    end
  end
end

