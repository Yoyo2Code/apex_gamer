class GiantBombService
  def initialize
    @connection = Faraday.new(:url => 'http://www.giantbomb.com/api/') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find

  end
end
