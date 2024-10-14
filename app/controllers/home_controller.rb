class HomeController < ApplicationController
  def index
    @states = State.all
    @kindergartens = Kindergarten.all

    @total = Kindergarten.count
    @latest = Kindergarten.order(updated_at: :desc).limit(1).pluck(:updated_at).first

    # Filter by state
    if params[:state].present?
      state = State.find_by(name: params[:state])
      @kindergartens = @kindergartens.where(state: state.name) if state.present?
      @cities = Kindergarten.where(state: state.name).distinct.order(:city).pluck(:city) if state.present?
    else
      @cities = []
    end


    # Filter by other params
    @kindergartens = @kindergartens.filter_by_name(params[:name])
                                   .filter_by_state(params[:state])
                                   .filter_by_city(params[:city])
                                   .filter_by_business_category(params[:business_category])
                                   .order(id: :asc)
                                   .page(params[:page])
                                   .per(10)

    # Handle Near Me feature (if latitude and longitude are present)
    if params[:latitude].present? && params[:longitude].present?
      user_location = [ params[:latitude], params[:longitude] ]
      @kindergartens = @kindergartens.near(user_location, 10) # within 10km radius
    end
  end

  def cities_for_state
    state = State.find_by(name: params[:state_name])
    @cities = Kindergarten.where(state: state.name).distinct.order(:city).pluck(:city) if state.present?

    respond_to do |format|
      format.json { render json: @cities }
    end
  end
end
