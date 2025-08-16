class DateCalculationService
  def calculate_time_difference(date_string)
    begin
      # Parse the input date (DD-MM-YYYY format)
      day, month, year = date_string.split("-")
      input_date = Date.new(year.to_i, month.to_i, day.to_i)
      current_date = Date.current

      # Calculate the difference in days
      days_difference = (current_date - input_date).to_i

      # Calculate years, months, and remaining days
      years = current_date.year - input_date.year
      months = current_date.month - input_date.month
      remaining_days = current_date.day - input_date.day

      # Adjust for negative months or days
      if remaining_days < 0
        months -= 1
        # Get the last day of the previous month
        last_month = Date.new(current_date.year, current_date.month, 1).prev_month.end_of_month
        remaining_days += last_month.day
      end

      if months < 0
        years -= 1
        months += 12
      end

      # Calculate total time units
      total_hours = days_difference * 24
      total_minutes = total_hours * 60

      # Calculate remaining hours and minutes from current time
      current_time = Time.current
      remaining_hours = current_time.hour
      remaining_minutes = current_time.min

      {
        years: years,
        months: months,
        days: remaining_days,
        hours: remaining_hours,
        minutes: remaining_minutes,
        total_days: days_difference,
        total_hours: total_hours,
        total_minutes: total_minutes
      }
    rescue => error
      raise "Error calculating date difference: #{error.message}"
    end
  end

  # Helper method to format the result
  def format_result(date_string)
    result = calculate_time_difference(date_string)

    {
      input_date: date_string,
      current_date: Date.current.strftime("%Y-%m-%d"),
      time_difference: {
        years: result[:years],
        months: result[:months],
        days: result[:days],
        hours: result[:hours],
        minutes: result[:minutes]
      },
      total: {
        total_days: result[:total_days],
        total_hours: result[:total_hours],
        total_minutes: result[:total_minutes]
      }
    }
  end
end 