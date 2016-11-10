class AddressesController < ApplicationController
  before_action :set_trip
  before_action :set_location
  before_action :set_address, except: [:index, :new, :create]
  def index
    @address = @trip.locations.address
  end

  def show
  end

  def new
    @address = @trip.locations.address.new
  end

  def create
    @address = @trip.locations.address.new(address_params)
    if @address.save
      redirect_to trip_location_address_path(@trip, @location, @address)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_address_path(@trip, @location, @address)
    else
      render :edit
  end

  def destroy
    @address.destroy
    redirect_to trip_locations_path(@trip)
  end

  private

  def address_params
    params.require(:address).permit(:city, :state, :zip)
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_location
    @location = @trips.locations.find(params[:location_id])
  end

  def set_address
    @address = @trips.locations.address.find(params[:id])
  end
end
