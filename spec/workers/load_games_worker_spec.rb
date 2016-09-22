require 'rails_helper'

describe "Loads games using Giantbomb Service" do
  xit "loads all games" do
    expect { LoadGamesWorker.perform_now }.to change(Game.all, :size)
  end
end
