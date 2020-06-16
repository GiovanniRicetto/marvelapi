require_relative '../api/get_characters'
require_relative '../api/get_series'

describe "Testing Marvel API", :all do
    let(:character) {GetCharacters.new.get_character}
    let(:serie) {GetSeries.new.get_serie}
    let(:allcharacters) {GetCharacters.new.get_all_characters}
    let(:allseries) {GetSeries.new.get_all_series}
    let(:characterserieintel) {GetCharacters.new.get_characterseries_information(@hulkid, @serieid)}
    let(:serieintel) {GetSeries.new.get_series_information(@serieid)}


    context "Healthcheck APIs", :healthcheck do
        it "GET all characters" do
            expect(allcharacters.code).to eq(200)
        end

        it "GET all series" do
            expect(allseries.code).to eq(200)
        end
    end

    context "Getting character intel", :characterapi do
        it "GET Hulk" do
            mycharactersis = character["data"]["results"][0]["name"]
            expect(mycharactersis).to eq("Hulk")
            expect(mycharactersis).not_to eq("Spider-Man")
        end

        it "GET a serie of Hulk", :hulkserieintel do
            characterserie = character["data"]["results"][0]["series"]["items"][18]["name"]
            expect(characterserie).to eq("Avengers & The Infinity Gauntlet (2018)")
            expect(characterserie).not_to eq("Avengers Annual")
        end
    end

    context "Getting Incredible Hulk Serie Info", :serieapi do
        it "GET one serie of Hulk", :hulkserie  do
            myseriessis = serie["data"]["results"][0]["title"]
            expect(myseriessis).to eq("Incredible Hulk (1962 - 1999)")
            expect(myseriessis).not_to eq("Fantastic Four")
        end

        it "GET a character of serie", :characterinaserie  do
            @serieid = serie["data"]["results"][0]["id"]
            seriecharacter = serieintel["data"]["results"][0]["characters"]["items"][19]["name"]
            expect(seriecharacter).to eq("Daredevil")
            expect(seriecharacter).not_to eq("Cable")
        end
    end

    context "Getting information in 2 APIs and crossing to get information", :crossingapis do
        it "Crossing information" do
            @hulkid = character["data"]["results"][0]["id"]
            @serieid = serie["data"]["results"][0]["id"]
            mycharacterserieis = characterserieintel["data"]["results"][0]["title"]
            expect(mycharacterserieis).to eq("Incredible Hulk (1962 - 1999)")
            expect(mycharacterserieis).not_to eq("Watchman")
        end
    end
end