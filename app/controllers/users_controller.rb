class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show]

  def show 
    @user_events = current_user.created_events.all
  end
end
