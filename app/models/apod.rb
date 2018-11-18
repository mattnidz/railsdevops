class Apod < ApplicationRecord
  
  attr_accessor :id, :copyright, :date, :explanation, :hdurl, :media_type, :service_version, :title, :url

  ConfigHelper.load()
  API_KEY = ENV["NASA_API_KEY"]
    
    
  def self.result()

    url = "https://api.nasa.gov/planetary/apod?api_key=#{API_KEY}"
    params = {  
      count: 1
    }

    response = HTTP.get(url, params: params)
    response.parse
  end

  
  def self.url()

    url = "https://api.nasa.gov/planetary/apod?api_key=#{API_KEY}"
    params = {  
      count: 1
    }

    response = HTTP.get(url, params: params)
    response.parse[0]["url"]
  end
    
end
