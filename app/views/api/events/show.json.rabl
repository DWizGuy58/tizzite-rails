object @event

attributes :id, :name, :description

node :latlon do |e|
  {
    lat: e.lat,
    lon: e.lon
  }
end

child :owner do
  extends 'api/users/show.json'
end