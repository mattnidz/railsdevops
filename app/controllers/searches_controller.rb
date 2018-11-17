

class SearchesController < ApplicationController
  
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  include WidgetsHelper
  DEFAULT_TERM = "burgers"
  DEFAULT_LOCATION = "San Francisco, CA"



  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @location = DEFAULT_LOCATION
    @term =  @search.search
   # @searches = @search.search(DEFAULT_TERM,DEFAULT_LOCATION)
    # @search.search(DEFAULT_TERM,DEFAULT_LOCATION)
    #@yelpjson = SearchesHelper.result(DEFAULT_TERM, DEFAULT_LOCATION)
    # render :json => @yelpjson.to_json
    @yelpjson = Search.all
    respond_to do |format|
      format.html { render :show}
      format.json { render :show, json: @yelpjson.to_json }
    # if @yelpjson
    #   format.html { redirect_to @yelpjson, notice: 'Search was successfully created.' }
    #   format.json { render :json: @yelpjson }
    # else
    #   format.html { render :new }
    #   format.json { render :json @yelpjson }
    # end
  end

  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:search)
    end
end
