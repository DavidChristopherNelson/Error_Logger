class ErrorsController < ApplicationController
  
  def index
    @errors = Error.all
  end

  def show
    @error = Error.find(params[:id])
  end
  
  def new
    @error = Error.new
  end
  
  def create
    @error = Error.new(error_params)
    if @error.save
      @rule = Rule.new
      @rule.rule_engine(@error)
      redirect_to @error
    else
      render 'new'
    end
  end
  
  def destroy
    Error.find(params[:id]).destroy
    redirect_to '/'
    flash[:success] = "Error Deleted"
  end
  
  def error_search
    @rules = Rule.all
    @errors = Error.where(:path => params[:q])
    @output = params[:q]
  end

  private
  
  def error_params
    params.require(:error).permit(:path, :read_status, :priority, :hostname,
                                  :date, :title, :details, :exception_class,
                                  :exception_message, :exception_stacktrace,
                                  :request_log, :environment_variables,
                                  :request_id, :remote_ip, :site_url)
  end
end