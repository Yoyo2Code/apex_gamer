json.array! @platforms do |platform|
  json.extract! platform, :id, :name, :original_price, :install_base, :total_revenue
end
