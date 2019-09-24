# module Profile
#   class LoactionsController < ApplicationController
#   end
# end
class Profile::LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new
      if @location.save
        # redirect_to location_path(@location)
      else
        render 'new'
      end
  end
end
