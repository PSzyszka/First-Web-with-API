class CampainsController < ApplicationController
  def index
    @campains = Unamo::GetData.campains
  rescue

  end

  def show
    @period = params['time_period'] || 'one_month'
    @keywords = Unamo::GetData.keywords(params[:id], @period.to_sym)
    @current_time = Unamo::TimeCalculator.current_time(@period.to_sym)
  end
end

