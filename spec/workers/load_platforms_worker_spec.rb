require 'rails_helper'

describe "Loads platforms using Giantbomb Service" do
  xit "loads all platforms" do
    expect { LoadPlatformsWorker.perform_async }.to change(Platform.all, :size)
  end
end
