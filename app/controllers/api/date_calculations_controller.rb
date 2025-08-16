module Api
  class DateCalculationsController < ApplicationController
    def calculate_date
      date_string = params[:date]
      
      if date_string.blank?
        render json: { error: "Date parameter is required" }, status: :bad_request
        return
      end

      begin
        service = DateCalculationService.new
        result = service.format_result(date_string)
        render json: result
      rescue => error
        render json: { error: error.message }, status: :unprocessable_entity
      end
    end
  end
end 