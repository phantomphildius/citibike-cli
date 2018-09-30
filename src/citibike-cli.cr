# A simple cli over the [NYC Citibike shard](https://github.com/woodruffw/citibike.cr/blob/master/src/citibike.cr)
# Run the executable and provide an address from the [GBFS](https://gbfs.citibikenyc.com/gbfs/en/station_information.json)

require "citibike"

module Citibike::Cli
  VERSION = "0.1.0"

  puts "What is station do you want to check?"

  location = gets

  if !location.nil?
    station = CitiBike.station_information.find { |station| station.name == location }

    if !station.nil?
      status = CitiBike.station_status
      bike = status.select { |info| info.station_id == station.station_id }.first

      puts "there are #{bike.num_bikes_available} bikes available"
      puts "there are #{bike.num_ebikes_available} e bikes available"
      puts "there are #{bike.num_bikes_disabled} disabled bikes"
      puts "there are #{bike.num_docks_available} docks available"
    else
      puts "not a valid station name"
    end

  else
    puts "must provide a station name"
  end
end
