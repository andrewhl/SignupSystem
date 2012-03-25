class ChildrenController < ApplicationController
  
  def new
    @child = Child.new
  end
  
  def create
    @child = Child.new(params[:child])
    if @child.save
      flash[:success] = "Your child was entered into the system successfully."
      redirect_to new_child_path
    else
      render 'new'
    end
  end
  
end
