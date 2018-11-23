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

  it "should contain the 'coord' hash" do
    expect(@dataset["coord"]).to be_kind_of Hash
  end

  it "should, in the coord hash, have only a longitude and a latitude" do
    expect(@dataset["coord"].length).to eq 2
    expect(@dataset["coord"].keys[0]).to eq "lon"
    expect(@dataset["coord"].keys[1]).to eq "lat"
  end

  it "should have a number between -180 and 180" do
    expect(@dataset["coord"]["lon"]).to be_kind_of Float
    expect(@dataset["coord"]["lat"]).to be_kind_of Float    
    expect(@dataset["coord"]["lon"]).to be_between(-180, 180)
    expect(@dataset["coord"]["lat"]).to be_between(-180, 180)

  end

  it "should contain the 'weather' array" do
    expect(@dataset["weather"]).to be_kind_of Array
  end

  it "should contain the 'base' string" do
    expect(@dataset["base"]).to be_kind_of String
  end

  it "should contain the 'main' hash" do
    expect(@dataset["main"]).to be_kind_of Hash
  end

  it "should contain the 'visibility' integer" do
    expect(@dataset["visibility"]).to be_kind_of Integer
  end

  it "should contain the 'wind' hash" do
    expect(@dataset["wind"]).to be_kind_of Hash
  end

  it "should contain the 'clouds' hash" do
    expect(@dataset["clouds"]).to be_kind_of Hash
  end

  it "should contain the 'dt' integer" do
    expect(@dataset["dt"]).to be_kind_of Integer
  end

  it "should contain the 'sys' hash" do
    expect(@dataset["sys"]).to be_kind_of Hash
  end

  it "should contain the 'id' integer" do
    expect(@dataset["id"]).to be_kind_of Integer
  end

  it "should contain the 'name' string" do
    expect(@dataset["name"]).to be_kind_of String
  end

  it "should contain the 'cod' integer" do
    expect(@dataset["cod"]).to be_kind_of Integer
  end
end
