class GiantBombService
  def initialize

  end

  def find
    Faraday.get("http://www.giantbomb.com/api/")
  end
end
