require 'rails_helper'

describe LoadPlatformsWorker do
  it "loads all platforms" do
    VCR.use_cassette("platforms_load_worker") do
      expect(Platform.all.count).to eq 6

      expect(LoadPlatformsWorker.jobs.size).to eq 0

      LoadPlatformsWorker.perform_async

      expect(LoadPlatformsWorker.jobs.size).to eq 1

      expect { LoadPlatformsWorker.drain }.to change(Platform.all, :size)
    end
  end
end
