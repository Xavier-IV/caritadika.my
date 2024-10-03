class HomeController < ApplicationController
  def index
    @kindergartens = Kindergarten.all
    @kindergartens = @kindergartens.filter_by_name(params[:name])
                                   .filter_by_state(params[:state])
                                   .filter_by_city(params[:city])
                                   .filter_by_business_type(params[:business_type])
                                   .page(params[:page])
                                   .per(10)
  end
end
