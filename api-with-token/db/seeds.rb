trip_names = ['安達としまむら',
              'Top Island Getaways',
              'Most Romantic Destinations',
              'Top Spots for Skiing']
trip_names.each do |trip_name|
  Trip.create(name: trip_name)
end
