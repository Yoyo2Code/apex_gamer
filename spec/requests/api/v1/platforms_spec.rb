require 'rails_helper'

describe "Platforms Endpoint" do
  fixtures :platforms
    it 'sends all platforms' do
      platform_one = Platform.first

      get '/api/v1/platforms'
      expect(response).to be_success

      json = JSON.parse(response.body)

      found_platform = json.find { |platform| platform["name"] == platform_one.name }

      expect(found_platform["name"]).to eq(platform_one.name)
      expect(found_platform["original_price"].to_f).to eq(platform_one.original_price)

      expect(found_platform["install_base"].to_i).to eq(platform_one.install_base)
      expect(found_platform["total_revenue"].to_f).to eq(platform_one.total_revenue)
    end
end
