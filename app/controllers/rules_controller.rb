require 'json'

class RulesController < ApplicationController
  
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
  
  private

  def rule_params
    params.require(:rule).permit(:execution_order, :filter)
  end
end
