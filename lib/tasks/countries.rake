require 'json'
require 'open-uri'

namespace :countries do
  desc "pulls countries data into database"
  task seed_countries: :environment do
    
    print "Deleting previous data ..."
    Country.destroy_all
    
    json = open('https://restcountries.eu/rest/v2/all?fields=name;region;capital;languages;currencies;flag')
    data = JSON.load(json)
    data.each do |c|
      
      Country.create!(
        name:     c["name"].to_s,
        region:   c["region"].to_s,
        capital:  c["capital"].to_s,
        language: c["languages"][0]["name"].to_s,
        currency: c["currencies"][0]["name"].to_s,
        flag:     c["flag"].to_s)
      end
    end
  end
