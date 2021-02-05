class UsersController < ApplicationController
  def show
    @user = current_user
    @room = Room.new
    @rooms = @user.rooms
  end
end
