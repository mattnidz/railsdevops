require "http"
module SearchesHelper
    config_files = ['secrets.yml']

    config_files.each do |file_name|
      file_path = File.join(Rails.root, 'config', file_name)
      config_keys = HashWithIndifferentAccess.new(YAML::load(IO.read(file_path)))[Rails.env]
      config_keys.each do |k,v|
        ENV[k.upcase] ||= v
      end
    end

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
    
      response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
      response.parse
    end

    # Returns a parsed json object of the request
def business(business_id)
    url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
  
    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    response.parse
  end

end
