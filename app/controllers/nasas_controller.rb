class NasasController < ApplicationController
  before_action :set_nasa, only: [:show, :edit, :update, :destroy]

  # GET /nasas
  # GET /nasas.json
  def index
    @nasas = Nasa.all
  end

  # GET /nasas/1
  # GET /nasas/1.json
  def show
  end

  # GET /nasas/new
  def new
    @nasa = Nasa.new
  end

  # GET /nasas/1/edit
  def edit
  end

  # POST /nasas
  # POST /nasas.json
  def create
    @nasa = Nasa.new(nasa_params)

    respond_to do |format|
      if @nasa.save
        format.html { redirect_to @nasa, notice: 'Nasa was successfully created.' }
        format.json { render :show, status: :created, location: @nasa }
      else
        format.html { render :new }
        format.json { render json: @nasa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nasas/1
  # PATCH/PUT /nasas/1.json
  def update
    respond_to do |format|
      if @nasa.update(nasa_params)
        format.html { redirect_to @nasa, notice: 'Nasa was successfully updated.' }
        format.json { render :show, status: :ok, location: @nasa }
      else
        format.html { render :edit }
        format.json { render json: @nasa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nasas/1
  # DELETE /nasas/1.json
  def destroy
    @nasa.destroy
    respond_to do |format|
      format.html { redirect_to nasas_url, notice: 'Nasa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def apod
    
    @json_string = Apod.result()
    @picture_url = Apod.url()
    
      respond_to do |format|
        
        format.html { render :apod}
        format.json { render :apod, json: @json_string.to_json }
        format.json { render :apod, json: @picture_url.to_json }

      end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nasa
      @nasa = Nasa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nasa_params
      params.require(:nasa).permit(:api, :url)
    end
end
