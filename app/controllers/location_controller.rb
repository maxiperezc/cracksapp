class LocationController < ApplicationController

  def index

    device = Device.find(params[:id])

    @locations = device ? Location.where(device_id: device.id) : nil

    render :layout => false

  end

end
