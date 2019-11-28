class BookingsController < ApplicationController
  before_action :not_booked, only: [:new, :create]
  before_action :correct_user, only: :destroy
  before_action :admin_user, only: :index

  def index
    @bookings = Booking.all
  end

  def show
  	@booking = Booking.find(params[:id])
  end

  def new
  	@booking = Booking.new
  	@rooms = Room.includes(:booking).where(bookings: {room_id: nil})
  end

  def create
  	@booking = Booking.new(booking_params)
  	if @booking.save
        flash[:success] = "Successfully booked!"
  		redirect_to @booking
  	else
  		render 'new'
  	end
  end

  def destroy
    Booking.find(params[:id]).destroy
    flash[:success] = "Booking deleted"
    redirect_to current_user
  end

  private
  	def booking_params
  		params.require(:booking).permit(:user_id, :room_id)
  	end

  	def not_booked
  		redirect_to root_url unless !(current_user.nil?) && current_user.booking.nil?
  	end


    def correct_user
        @booking = Booking.find(params[:id])
        redirect_to(root_url) unless !(@booking.user.nil?) && @booking.user == current_user
    end
    
    def admin_user
        redirect_to root_url unless current_user.admin?
    end
end
