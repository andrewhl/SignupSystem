class AspRegistrationController < ApplicationController
  
  def create

  end
  
  def update
  end
  
  def new
    @registration = AspRegistration.new
    @programs = AfterSchoolProgram.all
  end
  
  def show
    # @registrations = AspRegistration.find_all_by_id(params[:id])
  end
  
  def destroy
  end
  
end
