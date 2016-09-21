require 'rails_helper'

describe GiantBombService do
  context "it is initialized with default url" do
    it "has a default of 'giantbomb/api'" do
      gbs     = GiantBombService.new
      service = gbs.connection.headers["User-Agent"]

      expect(service).to eq("Faraday v0.9.2")
    end
  end

  context "#load_companies" do
    it "can find and load comanies" do
      VCR.use_cassette("companies") do
        expect { GiantBombService.new.load_companies }.to make_database_queries

        company = Company.last

        expect(company.name).to eq "BVM Produktion GmbH"
        expect(company.location_country).to eq nil
        expect(company.date_founded).to eq nil
      end
    end
  end

  context "#load_platforms" do
    it "can find and load platforms" do
      VCR.use_cassette("platforms") do
        expect { GiantBombService.new.load_platforms }.to make_database_queries

        platform = Platform.last

        expect(platform.name).to eq "FM-7"
        expect(platform.original_price.to_f).to eq 500
        expect(platform.install_base).to eq 0
        expect(platform.total_revenue.to_f).to eq 0
      end
    end
  end

  context "#load_games" do
    it "can find and load games" do
      VCR.use_cassette("games") do
        expect { GiantBombService.new.load_games }.to make_database_queries

        game = Game.last

        expect(game.name).to eq "Fantastic Fossils"
        expect(game.original_release_date).to eq "Sat, 30 Nov 1991 00:00:00 UTC +00:00"
        expect(game.site_detail_url).to eq "http://www.giantbomb.com/fantastic-fossils/3030-214/"
      end
    end
  end

  context "#parse_results" do
    it "grabs results and traslates from JSON" do
      data = "{\"results\":[{\"location_country\":\"USA\"},{\"location_country\":\"UK\"}]}"

      parsed_data = GiantBombService.new.parse_results(data)

      result = {"results"=>[{"location_country"=>"USA"}, {"location_country"=>"UK"}]}
      expect(parsed_data).to eq(result)
    end
  end

  context "#increment_offset" do
    it "increments offset by 1" do
      offset     = 1
      new_offset = GiantBombService.new.increment_offset(offset)

      expect(new_offset).to eq 2
    end
  end
end
