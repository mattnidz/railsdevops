
 
 require 'searches_helper'
class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  # require 'http'
  #helper :searches_helper
  

# # Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 5

# # Returns a parsed json object of the request
# def result(term, location)
#   url = "#{API_HOST}#{SEARCH_PATH}"
#   params = {
#     term: term,
#     location: location,
#     limit: SEARCH_LIMIT
#   }

#   response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
#   response.parse
# end


# # Returns a parsed json object of the request
# def business(business_id)
#   url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"

#   response = HTTP.auth("Bearer #{API_KEY}").get(url)
#   response.parse
# end


  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @term = @search.search
    @location = DEFAULT_LOCATION

    # response = SearchesHelper.result(DEFAULT_TERM, DEFAULT_LOCATION)
    # puts "Found #{response["total"]} businesses. Listing #{SEARCH_LIMIT}:"
    # response["businesses"].each {|biz| puts biz["name"]}
   
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
