require 'rails_helper'

describe "Data Saver handles saving models" do
  fixtures :all
    context ".save_companies" do
      it "can save companies" do
        VCR.use_cassette("data_saver_companies") do
         DataSaver.new.save_companies

         company = Company.find_by(name: "Heros Programmed")

         expect(company.name).to eq("Heros Programmed")
         expect(company.location_country).to eq("United Kingdom")
         expect(company.date_founded).to eq("2016-09-20 00:40:30")
       end
      end
    end

    context ".save_platforms" do
      it "can save platforms" do
        VCR.use_cassette("data_saver_platforms") do
         DataSaver.new.save_platforms

         platform = Platform.find_by(name: "Amiga")
         expect(platform.name).to eq("Amiga")
         expect(platform.original_price).to eq(1285.0)
         expect(platform.install_base).to eq(6000000)
       end
      end
    end

    context ".save_games" do
      it "can save games" do
        VCR.use_cassette("data_saver_games") do
         DataSaver.new.save_games

         game = Game.find_by(name: "Camelot Warriors")

         expect(game.name).to eq("Camelot Warriors")
         expect(game.original_release_date).to eq(nil)
         expect(game.site_detail_url).to eq("http://www.giantbomb.com/camelot-warriors/3030-7/")
       end
      end
    end
  end
