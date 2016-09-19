class ChartKickFormatter
  def self.companies_with_country(data)
    result = data.each_with_object(Hash.new(0)) { |country,counts| counts[country["location_country"]] += 1 }
    result.delete(nil)
    result

    # group_countries(result)
  end

  def self.group_countries(countries)
    country_data = countries.map do |country|
      country
      # standardize_countries(country)
    end
  end

  # def self.standardize_countries(country)
  #   country[0] = "United Kingdom" if country.first === "UK"
  #   country[0] = "United States of America" if country.first === "USA"
  #   country[0] = "United States of America" if country.first === "United States"
  #   country[0] = "United States of America" if country.first === "Unied States"
  # end
end
