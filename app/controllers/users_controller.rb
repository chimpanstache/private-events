class UsersController < ApplicationController
  def show
    @own_events = current_user.events.all
  end
end
