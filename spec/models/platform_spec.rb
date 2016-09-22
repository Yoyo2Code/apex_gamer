require 'rails_helper'

describe "platform" do
  fixtures :platforms
  context "#calculate_total_revenue" do
    it "multiplies base and price for total revenue" do
      platform = Platform.new( name: "GamerBoy",
                               original_price: 10.0,
                               install_base: 2,
                               release_date: "1954-12-08 00-00-00"
                             )

      total_revenue = platform.calculate_total_revenue

      calculation = platform.original_price * platform.install_base

      expect(total_revenue).to eq calculation
    end
  end

  context ".valid_platforms" do
    it "only displays valid platforms with release dates" do
      invalid_platform = Platform.find_by(release_date: nil)

      expect(Platform.all.count).to eq 6

      expect(Platform.valid_platforms.count).to eq 5
      expect(Platform.valid_platforms).to_not include(invalid_platform)
    end
  end

  context ".sales_for_top_five_newest_platforms" do
    it "grabs top five newest valid platforms with release dates" do
      invalid_platform = Platform.find_by(release_date: nil)

      expect(Platform.all.count).to eq 6

      expect(Platform.top_five_newest_platforms.count).to eq 5
      expect(Platform.top_five_newest_platforms).to_not include(invalid_platform)
    end
  end
end
