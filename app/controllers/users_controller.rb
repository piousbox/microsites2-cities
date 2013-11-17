
class UsersController < ApplicationController

  def organizer
    authorize! :organizer, current_user
    render :layout => 'application'
  end

end

