describe "Testing the weather data" do
  before (:all) do
    @dataset = ParseWeather.new('weather_data.json').weather_file
    @weather_hash = @dataset["weather"].first
    @main_hash = @dataset["main"]
    @wind_hash = @dataset["wind"]
    @sys_hash = @dataset["sys"]
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

  context "in the coord hash" do

    it "should have only a longitude and a latitude" do
      expect(@dataset["coord"].length).to eq 2
      expect(@dataset["coord"].keys[0]).to eq "lon"
      expect(@dataset["coord"].keys[1]).to eq "lat"
    end

    it "should have a number between -180 and 180 for longitude" do
      expect(@dataset["coord"]["lon"]).to be_kind_of Float
      expect(@dataset["coord"]["lon"]).to be_between(-180, 180)
    end

    it "should have a number between -90 and 90 for latitude" do
      expect(@dataset["coord"]["lat"]).to be_kind_of Float
      expect(@dataset["coord"]["lat"]).to be_between(-180, 180)
    end

  end




  it "should contain the 'weather' array" do
    expect(@dataset["weather"]).to be_kind_of Array
  end

  context "in the 'weather' array" do

    it "should have only one entry, which is a hash" do
      expect(@dataset["weather"].length).to eq 1
      expect(@dataset["weather"].first).to be_kind_of Hash
    end

    context "in the weather hash" do

      it "should contain 5 key/value pairs" do
        expect(@weather_hash.length).to eq 4
        expect(@weather_hash.keys.length).to eq @weather_hash.values.length
      end

      it "should contain an id which is an integer" do
        expect(@weather_hash["id"]).to be_kind_of Integer
        # there should be a unique check for id's
      end

      it "should contain 'main' entry which is a string with a capitalised first letter" do
        expect(@weather_hash["main"]).to be_kind_of String
        expect(@weather_hash["main"]).to eq @weather_hash["main"].capitalize
        expect(@weather_hash["main"]).not_to be ""
      end

      it "should contain 'description' entry which is a string" do
        expect(@weather_hash["description"]).to be_kind_of String
        expect(@weather_hash["description"]).not_to be ""
      end

      it "should contain 'icon' entry which is a string" do
        expect(@weather_hash["icon"]).to be_kind_of String
        expect(@weather_hash["icon"]).not_to be ""
      end
    end

  end



  it "should contain the 'base' string" do
    expect(@dataset["base"]).to be_kind_of String
  end




  it "should contain the 'main' hash" do
    expect(@dataset["main"]).to be_kind_of Hash
  end

  context "in the 'main hash'" do

    it "should contain 5 key/value pairs" do
      expect(@main_hash.length).to eq 5
      expect(@main_hash.keys.length).to eq @main_hash.values.length
    end

    it "should contain 'temp' entry which is a float greater than absolute zero" do
      expect(@main_hash["temp"]).to be_kind_of Float
      expect(@main_hash["temp"]).to be >= -273.15
    end

    it "should contain 'pressure' entry which is a non-negative float" do
      # this checks for integer too as source file uses an integer, but this totally should be a float
      expect(@main_hash["pressure"]).to be_kind_of(Float).or be_kind_of(Integer)
      expect(@main_hash["pressure"]).to be >= 0
    end

    it "should contain 'humidity' entry which is a non-negative float" do
      # this checks for integer too as source file uses an integer, but this totally should be a float
      expect(@main_hash["humidity"]).to be_kind_of(Float).or be_kind_of(Integer)
      expect(@main_hash["humidity"]).to be >= 0
    end

    it "should contain 'temp_min' entry which is a float greater than absolute zero" do
      # this will fail as humidity should be a float in the json file
      expect(@main_hash["temp_min"]).to be_kind_of Float
      expect(@main_hash["temp_min"]).to be >= 0
    end

    it "should contain 'temp_max' entry which is a float greater than 'temp_min'" do
      # this will fail as humidity should be a float in the json file
      expect(@main_hash["temp_max"]).to be_kind_of Float
      expect(@main_hash["temp_max"]).to be >= @main_hash["temp_min"]
    end

  end




  it "should contain the 'visibility' integer" do
    expect(@dataset["visibility"]).to be_kind_of Integer
  end

  context "about visibility" do

    it "should be greater than 0" do
      expect(@dataset["visibility"]).to be >= 0
    end

  end




  it "should contain the 'wind' hash" do
    expect(@dataset["wind"]).to be_kind_of Hash
  end

  context "in the 'wind' hash" do
    it "should contain 2 key/value pairs" do
      expect(@wind_hash.length).to eq 2
      expect(@wind_hash.keys.length).to eq @wind_hash.values.length
    end

    it "should contain 'speed' entry which is a float greater than zero" do
      expect(@wind_hash["speed"]).to be_kind_of Float
      expect(@wind_hash["speed"]).to be >= 0
    end

    it "should contain 'deg' entry which is an integer between 0 and 360" do
      expect(@wind_hash["deg"]).to be_kind_of(Float).or be_kind_of(Integer)
      expect(@wind_hash["deg"]).to be_between(0,360)
    end
  end




  it "should contain the 'clouds' hash" do
    expect(@dataset["clouds"]).to be_kind_of Hash
  end

  context "in the 'clouds' hash" do
    it "should contain only 1 key/value pair" do
      expect(@dataset["clouds"].length).to eq 1
      expect(@dataset["clouds"].keys.length).to eq @dataset["clouds"].values.length
    end

    it "should contain 'all' entry which should be an integer" do
      expect(@dataset["clouds"]["all"]).to be_kind_of Integer
    end
  end




  it "should contain the 'dt' integer" do
    expect(@dataset["dt"]).to be_kind_of Integer
  end

  context "about dt" do

    it "should be greater than 0" do
      expect(@dataset["dt"]).to be >= 0
    end

  end




  it "should contain the 'sys' hash" do
    expect(@dataset["sys"]).to be_kind_of Hash
  end

  context "in the 'sys' hash" do

    it "should contain 6 key/value pairs" do
      expect(@sys_hash.length).to eq 6
      expect(@sys_hash.keys.length).to eq @sys_hash.values.length
    end

    it "should contain 'type' entry which is a non-negative integer" do
      expect(@sys_hash["type"]).to be_kind_of Integer
      expect(@sys_hash["type"]).to be >= 0
    end

    it "should contain 'id' entry which is a non-negative integer" do
      expect(@sys_hash["id"]).to be_kind_of Integer
      expect(@sys_hash["id"]).to be >= 0
    end

    it "should contain 'message' entry which is a non-negative integer" do
      expect(@sys_hash["message"]).to be_kind_of Float
      expect(@sys_hash["message"]).to be >= 0
    end

    it "should contain 'country' entry which is an upper-case, short country code string" do
      expect(@sys_hash["country"]).to be_kind_of String
      expect(@sys_hash["country"].length).to be > 0
      expect(@sys_hash["country"].length).to be < 5
      expect(@sys_hash["country"]).to eq @sys_hash["country"].upcase
    end

    it "should contain 'sunrise' entry which is a non-negative integer" do
      expect(@sys_hash["sunrise"]).to be_kind_of Integer
      expect(@sys_hash["sunrise"]).to be >= 0
      expect(@sys_hash["sunrise"].to_s.length).to eq 10

    end

    it "should contain 'sunset' entry which is a non-negative integer" do
      expect(@sys_hash["sunset"]).to be_kind_of Integer
      expect(@sys_hash["sunset"]).to be >= 0
      expect(@sys_hash["sunset"].to_s.length).to eq 10
    end

  end




  it "should contain the 'id' integer" do
    expect(@dataset["id"]).to be_kind_of Integer
  end

  context "about id" do

    it "should be an integer that is greater than 0" do
      expect(@dataset["id"]).to be_kind_of Integer
      expect(@dataset["id"]).to be > 0
    end

  end




  it "should contain the 'name' string" do
    expect(@dataset["name"]).to be_kind_of String
  end

  context "about name" do

    it "should be a string that has length greater than 0" do
      expect(@dataset["name"]).to be_kind_of String
      expect(@dataset["name"].length).to be > 0
    end

  end




  it "should contain the 'cod' integer" do
    expect(@dataset["cod"]).to be_kind_of Integer
  end

  context "about cod" do

    it "should be an integer that is greater than 0" do
      expect(@dataset["cod"]).to be_kind_of Integer
      expect(@dataset["cod"]).to be > 0
    end

  end
end
