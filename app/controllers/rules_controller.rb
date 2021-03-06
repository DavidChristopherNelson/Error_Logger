require 'json'

class RulesController < ApplicationController
  
  def index
    @rules = Rule.all
  end

  def show
    @rule = Rule.find(params[:id])
  end
  
  def new
    @rule = Rule.new
  end
  
  def create
    @rule = Rule.new(rule_params)
    if @rule.save
      redirect_to @rule
    else
      render 'new'
    end
  end
  
  def destroy
    Rule.find(params[:id]).destroy
    redirect_to '/'
    flash[:success] = "Rule Deleted"
  end
  
  private

  def rule_params
    params.require(:rule).permit(:execution_order, :field, :path, :regex)
  end
end
