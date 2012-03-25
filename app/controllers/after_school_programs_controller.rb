class AfterSchoolProgramsController < ApplicationController
  before_filter :admin_user
  
  def new
    @program = AfterSchoolProgram.new
  end

  def show
    @programs = AfterSchoolProgram.all
    
  end

  def destroy
    @program = AfterSchoolProgram.find(params[:id]).destroy
    flash[:success] = "Program deleted."
    redirect_to after_school_programs_path
  end

  def edit
  end
  
  def update
    @program = AfterSchoolProgram.find(params[:id])
    if @program.update_attributes(params[:after_school_program])
      flash[:success] = "Program updated"
      redirect_to after_school_programs_path
    else
      render 'show'
    end
  end
  
  def edit_all
    @programs = AfterSchoolProgram.all
  end
  
  def index
    @programs = AfterSchoolProgram.all
  end
  
  def create
    @program = AfterSchoolProgram.new(params[:after_school_program])
    if @program.save
      flash[:success] = "Your program has been created!"
      redirect_to after_school_programs_path
    else
      render 'new'
    end
  end
end