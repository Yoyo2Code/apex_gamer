class ChartKickFormatter
  def self.companies_with_country(data)
    if data.nil? == false
      result = data.each_with_object(Hash.new(0)) { |country,counts| counts[country["location_country"]] += 1 }
      result.delete(nil)
      result
    end
  end
end
