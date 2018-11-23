describe "Testing the weather data" do
  before (:all) do
    @dataset = ParseWeather.new('weather_data.json').weather_file
  end


  it "should be a hash" do
    expect(@dataset).to be_kind_of Hash
  end

  it "should contain 12 key/value pairs" do
    expect(@dataset.length).to eq 12
    expect(@dataset.keys.length).to eq @dataset.values.length
  end
end
