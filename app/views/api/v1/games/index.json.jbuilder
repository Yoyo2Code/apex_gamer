json.array! @games do |game|
  json.extract! game, :id, :name, :original_release_date, :site_detail_url
end
