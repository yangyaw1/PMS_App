class RoomsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  def index
  	@rooms = Room.all
  end

  def show
  	@room = Room.find(params[:id])
  end

  def new
  	@room = Room.new
  end

  def create
  	@room = Room.new(room_params)
  	if @room.save
        flash[:success] = "Successfully add the room"
  		redirect_to @room
  	else
  		render 'new'
  	end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = "Updated"
      redirect_to @room
    else
      render 'edit'
    end
  end

  def destroy
    Room.find(params[:id]).destroy
    flash[:success] = "Room deleted"
    redirect_to rooms_url
  end

  private
  	def room_params
  		params.require(:room).permit(:num, :info)
  	end
    
    def logged_in_user
      unless logged_in?
        flahp[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end

end
