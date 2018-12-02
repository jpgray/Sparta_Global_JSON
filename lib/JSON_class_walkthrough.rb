require 'json'
require 'date'

class ParseJson
  attr_accessor :json_file
  attr_accessor :json_date

  def initialize(json_file)

    @json_file = JSON.parse(File.read(json_file))

  end

  def parse_date
    Date.parse(@json_file["date"])
  end

  def valid?
    @json_date = parse_date
    Date.valid_date?(@json_date.year, @json_date.month, @json_date.day)
  end

end
