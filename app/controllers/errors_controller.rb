class ErrorsController < ApplicationController
  
  def show
    @error = Error.find(params[:id])
    @rule = Rule.new
    @rule_engine_output = @rule.rule_engine(@error)
  end
  
  def new
    @error = Error.new
  end
  
  def create
    @error = Error.new(error_params)
    if @error.save
      rule_engine error
      redirect_to @error
    else
      render 'new'
    end
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