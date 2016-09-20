class CompanyDataSaver

  def self.save_companies(companies)
    companies.each do |company|
      Company.find_or_create_by(company)
    end
  end
end
