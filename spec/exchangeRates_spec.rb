# require_relative "spec_helper"

describe "Testing the exchange rates" do
  before (:all) do
    @exchange = ParseJson.new('json_exchange_rates.json')
    @exchange_data = @exchange.json_file["rates"]
  end

  it "should be a hash" do
    expect(@exchange.json_file).to be_kind_of Hash
  end

  it "should contain the base as the string 'EUR'" do
    expect(@exchange.json_file["base"]).to eq "EUR"
  end

  it "should contain the rates as a hash" do
    expect(@exchange_data).to be_kind_of Hash
  end

  it "should contain 31 data key/value pairs in the rates hash" do
    expect(@exchange_data.length).to eq 31
    expect(@exchange_data.keys.length).to eq @exchange_data.values.length
  end

  it "should only have rates that are numbers greater than 0" do
    @exchange_data.values.each do |rate|
      expect(rate).to be > 0
    end
  end

  it "should have rates with each key of 3, upper case characters" do
    @exchange_data.keys.each do |key|
      expect(key.length).to eq 3
      expect(key).to eq key.upcase
    end
  end

  it "should contain a recent, valid date, that is before the current date, in string format" do
    expect(@exchange.json_file["date"]).to be_kind_of String
    expect(@exchange.valid?).to be true
    expect(@exchange.json_date.jd).to be < DateTime.now.jd
    expect(@exchange.json_date.year).to be > ((DateTime.now.year) -2)
  end
end
