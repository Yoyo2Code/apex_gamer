class DataController < ApplicationController

  def index
    LoadCompaniesWorker.perform_async
    LoadPlatformsWorker.perform_async
    LoadGamesWorker.perform_async

    flash[:success] = "Now Searching for New Data"
    redirect_to root_path
  end
end
