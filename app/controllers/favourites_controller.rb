class FavouritesController < ActionController::Base

    before_action :authorize
    before_action :set_favourite, only: [:show, :edit, :update, :destroy]

    def index
      @favourites = Favourite.all
    end

    def show
    end

    def new
      @favourite = Favourite.new
    end

    def edit
    end

    def create
      @favourite = @favourite.new(favourite_params)

      respond_to do |format|
        if @favourite.save

          format.html { redirect_to @favourite, notice: 'A HungryHelper favourite was successfully created.'}
          format.json { render :show, status: :created, location: @favourite }
        else
          format.html { render :new }
          format.json { render json: @favourite.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @favourite.update(favourite_params)
          format.html { redirect_to favourite, notice: 'A HungryHelper favourite was successfully updated.' }
          format.json { render :show, status: :ok, location: @favourite }
        else
          format.html { render :edit }
          format.json { render json: @favourite.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @favourite.destroy
      respond_to do |format|
        format.html { redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

end
