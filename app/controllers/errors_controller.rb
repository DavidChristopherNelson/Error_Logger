class ErrorsController < ApplicationController
  def new
    @error = Error.new
  end
  
  def create
    @error = Error.new(error_params)
    if @error.save
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  private
  
  def error_params
    params.require(:error).permit(:name, :email, :password, :password_confirmation)
  end
end