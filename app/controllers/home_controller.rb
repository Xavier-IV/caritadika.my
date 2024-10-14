class HomeController < ApplicationController
  def index
    @states = State.all

    @kindergartens = Kindergarten.all

    if params[:state].present?
      state = State.find_by(name: params[:state])
      @kindergartens = @kindergartens.where(state: state) if state.present?
      @cities = Kindergarten.where(state: state.name).distinct.order(:city).pluck(:city) if state.present?
    else
      @cities = []
    end

    if params[:city].present?
      city = City.find_by(name: params[:city])
      @kindergartens = @kindergartens.where(city: city) if city.present?
    end

    @kindergartens = Kindergarten.all
    @kindergartens = @kindergartens.filter_by_name(params[:name])
                                   .filter_by_state(params[:state])
                                   .filter_by_city(params[:city])
                                   .filter_by_business_category(params[:business_category])
                                   .order(id: :asc)
                                   .page(params[:page])
                                   .per(10)
  end

  def cities_for_state
    state = State.find_by(name: params[:state_name])
    # @cities = state.cities.order(name: :asc) if state.present?

    @cities = Kindergarten.where(state: state.name).distinct.order(:city).pluck(:city)

    puts @cities


    respond_to do |format|
      format.json { render json: @cities }
    end
  end
end
