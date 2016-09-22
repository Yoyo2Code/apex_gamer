require 'rails_helper'

describe LoadCompaniesWorker do
  it "loads all companies" do
    VCR.use_cassette("company_load_worker") do
      expect(Company.all.count).to eq 6

      LoadCompaniesWorker.jobs.clear

      expect(LoadCompaniesWorker.jobs.size).to eq 0

      LoadCompaniesWorker.perform_async

      expect(LoadCompaniesWorker.jobs.size).to eq 1

      expect { LoadCompaniesWorker.drain }.to change(Company.all, :size)
    end
  end
end
