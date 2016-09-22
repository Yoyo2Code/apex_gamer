require 'rails_helper'

describe LoadGamesWorker do
  it "loads all games" do
    VCR.use_cassette("games_load_worker") do
      expect(Game.all.count).to eq 6

      expect(LoadGamesWorker.jobs.size).to eq 0

      LoadGamesWorker.perform_async

      expect(LoadGamesWorker.jobs.size).to eq 1

      expect { LoadGamesWorker.drain }.to change(Game.all, :size)
    end
  end
end
