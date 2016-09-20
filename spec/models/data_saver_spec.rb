require 'rails_helper'

describe "Data Saver handles saving models" do
  fixtures :all
    context ".save_companies" do
      it "can save companies" do
        new_company_data = { "name" => "Hippos",
                             "location_country" => "UK",
                             "date_founded" => "1989-01-02 00:00:00"
                           }
         DataSaver.save_companies([new_company_data])

         company = Company.find_by(name: new_company_data["name"])

         expect(company.name).to eq(new_company_data["name"])
         expect(company.location_country).to eq(new_company_data["location_country"])
         expect(company.date_founded).to eq(new_company_data["date_founded"])
      end
    end

    context ".save_platforms" do
      it "can save platforms" do
        new_platform_data = { "name" => "Bingo",
                              "original_price" => 100.0,
                              "install_base" => 2
                            }

         DataSaver.save_platforms([new_platform_data])

         platform = Platform.find_by(name: new_platform_data["name"])

         expect(platform.name).to eq(new_platform_data["name"])
         expect(platform.original_price).to eq(new_platform_data["original_price"])
         expect(platform.install_base).to eq(new_platform_data["install_base"])
      end
    end

    context ".save_games" do
      it "can save games" do
        new_game_data = { "name" => "Breakfree",
                          "original_release_date" => "1995-12-31 00:00:00",
                          "site_detail_url" => "http://www.giantbomb.com/breakfree/3030-2/"
                        }

         DataSaver.save_games([new_game_data])

         game = Game.find_by(name: new_game_data["name"])

         expect(game.name).to eq(new_game_data["name"])
         expect(game.original_release_date).to eq(new_game_data["original_release_date"])
         expect(game.site_detail_url).to eq(new_game_data["site_detail_url"])
      end
    end
  end
