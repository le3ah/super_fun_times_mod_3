class SearchController < ApplicationController
  def index
    zip = params["q"]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params["fuel_type"] = "ELEC,LPG"
      faraday.params["api_key"] = "SnXgFbkXBSEiZOY56gu0bq3uA7hLf0zhhEPQXJ3O"
      faraday.params["location"] = zip
      faraday.params["radius"] = 6.0
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json")
    binding.pry
    @stations = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
