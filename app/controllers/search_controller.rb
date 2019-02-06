class SearchController < ApplicationController
  def index
    zip = params["q"]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params["fuel_type"] = "ELEC,LPG"
      faraday.params["api_key"] = ENV["nrel_key"]
      faraday.params["location"] = zip
      faraday.params["radius"] = 6.0
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json")
    results = JSON.parse(response.body)
    @stations = results["fuel_stations"].map do |station|
      Station.new(station)
    end
  end
end
