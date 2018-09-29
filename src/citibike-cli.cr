# TODO: Write documentation for `Citibike::Cli`
require "citibike"
require "option_parser"

module Citibike::Cli
  VERSION = "0.1.0"

  destination = ""

  OptionParser.parse! do |parser|
    parser.banner = "Usage: citibike-cli [arguments]"
    parser.on("-f ZIPCODE", "--find ZIPCODE", "Finds stations near your zipcode") { |zip| location = zip }
    parser.on("-b NAME", "--bikes=NAME", "Returns the bike count for the station") { |name| destination = name }
    parser.on("-d NAME", "--docks=NAME", "Returns the dock count for the station") { |name| destination = name }
    parser.on("-h", "--help", "Show this help") { puts parser }
  end

  info = CitiBike.station_information
  station = info.find { |station| station.name == destination }

  if !station.nil?
    status = CitiBike.station_status
    bike = status.select { |info| info.station_id == station.station_id }.first

    puts "there are #{bike.num_bikes_available} bikes available"
    puts "there are #{bike.num_ebikes_available} e bikes available"
    puts "there are #{bike.num_bikes_disabled} disabled bikes"
    puts "there are #{bike.num_docks_available} docks available"
  else
    puts "station #{destination} doesn't exist"
  end
end
