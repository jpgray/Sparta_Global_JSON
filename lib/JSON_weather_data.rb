require 'json'

class ParseWeather
  attr_accessor :weather_file

  def initialize(json_file)

    @weather_file = JSON.parse(File.read(json_file))

  end

end
