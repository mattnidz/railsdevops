class Search < ApplicationRecord
    has_many :widgets
    accepts_nested_attributes_for :widgets

        ConfigHelper.load()
    
        API_KEY = ENV["YELP_API_KEY"]
    
    
        # Constants, do not change these
        API_HOST = "https://api.yelp.com"
        SEARCH_PATH = "/v3/businesses/search"
        BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
        
        
        DEFAULT_BUSINESS_ID = "yelp-san-francisco"
        DEFAULT_TERM = "dinner"
        DEFAULT_LOCATION = "San Francisco, CA"
        SEARCH_LIMIT = 5
        
        # Returns a parsed json object of the request
        def self.result(term, location)
          url = "#{API_HOST}#{SEARCH_PATH}"
          params = {
            term: term,
            location: location,
            limit: SEARCH_LIMIT
          }
          
          # append to empty array then return names once built
          the_arr = []
          response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
          the_json = response.parse["businesses"]
          the_json.each do |f|
            the_arr << f["name"]
          end
          return the_arr
        end

        def self.search 
        end



end
