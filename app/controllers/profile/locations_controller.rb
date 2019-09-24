# module Profile
#   class LoactionsController < ApplicationController
#   end
# end
class Profile::LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(strong_params_profile)
    @location.user = current_user
      if @location.save
        redirect_to location_path(@location)
      else
        render :new
      end
  end

  private

  def strong_params_profile
    params.require(:location).permit(:name, :description, :address, :hourly_rate, :photo, :start_date, :end_date, :commercial_use, :monument, :landscape, :user_id)
  end
end
