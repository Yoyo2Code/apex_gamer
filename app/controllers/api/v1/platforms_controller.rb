class Api::V1::PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
  end
end
