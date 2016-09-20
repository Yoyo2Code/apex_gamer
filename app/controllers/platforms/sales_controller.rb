class Platforms::SalesController < ApplicationController
  def index
    @platforms = Platform.all
    LoadCompaniesWorker.perform_async
  end
end
