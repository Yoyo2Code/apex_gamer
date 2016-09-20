json.array! @companies do |company|
  json.extract! company, :id, :name, :location_country, :date_founded
end
