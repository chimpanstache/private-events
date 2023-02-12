class UsersController < ApplicationController
  def show
    @own_events = current_user.events.all
    @past_attendances = current_user.attended_events.where('time < ?', Time.now)
    @future_attendances = current_user.attended_events.where('time > ?', Time.now)
  end
end
