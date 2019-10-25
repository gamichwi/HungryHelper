class AutocomplettesController < ApplicationController
  before_action :set_autocomplette, only: [:show, :edit, :update, :destroy]

  # GET /autocomplettes
  # GET /autocomplettes.json
  def index
    @autocomplettes = Autocomplette.all
  end

  # GET /autocomplettes/1
  # GET /autocomplettes/1.json
  def show
  end

  # GET /autocomplettes/new
  def new
    @autocomplette = Autocomplette.new
  end

  # GET /autocomplettes/1/edit
  def edit
  end

  # POST /autocomplettes
  # POST /autocomplettes.json
  def create
    @autocomplette = Autocomplette.new(autocomplette_params)

    respond_to do |format|
      if @autocomplette.save
        format.html { redirect_to @autocomplette, notice: 'Autocomplette was successfully created.' }
        format.json { render :show, status: :created, location: @autocomplette }
      else
        format.html { render :new }
        format.json { render json: @autocomplette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autocomplettes/1
  # PATCH/PUT /autocomplettes/1.json
  def update
    respond_to do |format|
      if @autocomplette.update(autocomplette_params)
        format.html { redirect_to @autocomplette, notice: 'Autocomplette was successfully updated.' }
        format.json { render :show, status: :ok, location: @autocomplette }
      else
        format.html { render :edit }
        format.json { render json: @autocomplette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autocomplettes/1
  # DELETE /autocomplettes/1.json
  def destroy
    @autocomplette.destroy
    respond_to do |format|
      format.html { redirect_to autocomplettes_url, notice: 'Autocomplette was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_autocomplette
      @autocomplette = Autocomplette.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def autocomplette_params
      params.require(:autocomplette).permit(:address, :street_number, :locality, :route, :administrative_area_level_1, :country, :postal_code)
    end
end
