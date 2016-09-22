require 'rails_helper'

describe "Loads companies using Giantbomb Service" do
  xit "loads all companies" do
    expect { LoadCompaniesWorker.perform_now }.to change(Company.all, :size)
  end
end
