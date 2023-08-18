# frozen_string_literal: true

# Cities API actions
class CitiesController < ApplicationController
  before_action :set_city, only: %i[show edit update destroy]

  # GET /cities or /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1 or /cities/1.json
  def show; end

  def new_search; end

  def search
    cities_by_name = search_params[:name].blank? ? City.all : City.search_by_name(search_params[:name])
    cities_by_state_name =
      if search_params[:state_name].blank?
        City.all
      else
        City.search_by_state_name(search_params[:state_name])
      end

    @cities = cities_by_name & cities_by_state_name
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit; end

  # POST /cities or /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to city_url(@city), notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to city_url(@city), notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city.destroy

    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def city_params
    params.require(:city).permit(:name, :population, :state_id)
  end

  def search_params
    params.require(:search_cities).permit(:state_name, :name)
  end
end
