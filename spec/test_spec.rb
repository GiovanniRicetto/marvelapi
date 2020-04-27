require_relative '../api/get_characters'
require_relative '../api/get_series'

describe "Testing Marvel API" do
    before(:all) do
        @characters = GetCharacters.new
        @series = GetSeries.new
    end

    context "Getting information" do
        it "GET all characters" do
            get = @characters.get_all_characters
            expect(get.code).to eq(200)
        end

        it "GET one characters" do
            get = @characters.get_all_characters
            amountofcharacters = get["data"]["results"].count
            characternumber = rand(0..amountofcharacters)
            mycharactersis = get["data"]["results"][characternumber]["name"]
            expect(mycharactersis).to be_kind_of(String)
        end

        it "GET series of a character" do
            get = @characters.get_all_characters
            amountofcharacters = get["data"]["results"].count
            characternumber = rand(0..amountofcharacters)
            characterid = get["data"]["results"][characternumber]["id"]
            characterinformation = @characters.get_characters_information(characterid)
            characterseries = characterinformation["data"]["results"][0]["series"]
            expect(characterseries).to be_kind_of(Hash)
        end

        it "GET all series" do
            get = @series.get_all_series
            expect(get.code).to eq(200)
        end

        it "GET one series" do
            get = @series.get_all_series
            amountofseries = get["data"]["results"].count
            seriesnumber = rand(0..amountofseries)
            myseriessis = get["data"]["results"][seriesnumber]["title"]
            expect(myseriessis).to be_kind_of(String)
        end

        it "GET characters of series" do
            get = @series.get_all_series
            amountofseries = get["data"]["results"].count
            sleep 0.5
            seriesnumber = rand(0..amountofseries)
            seriesid = get["data"]["results"][seriesnumber]["id"]
            seriesinformation = @series.get_series_information(seriesid)
            seriescharacters = seriesinformation["data"]["results"][0]["characters"]
            expect(seriescharacters).to be_kind_of(Hash)
        end
    end

    context "Getting information and crossing it" do
        it "Crossing information" do
            get = @characters.get_all_characters
            amountofcharacters = get["data"]["results"].count
            characternumber = rand(0..amountofcharacters)
            characterid = get["data"]["results"][characternumber]["id"]
            characterinformation = @characters.get_characters_information(characterid)
            characterseries = characterinformation["data"]["results"][0]["series"]
            amountofseries = characterseries["items"].count
            serienumber = rand(0..amountofseries)
            sleep 1
            seriesname = characterseries["items"][serienumber]["name"]
            ##
            
            get = @series.get_all_series
            amountofseries = get["data"]["results"].count
            sleep 0.5
            seriesnumber = rand(0..amountofseries)
            seriesid = get["data"]["results"][seriesnumber]["id"]
            seriesinformation = @series.get_series_information(seriesid)
            seriestitle = seriesinformation["data"]["results"][0]["title"]
            matcher = expect(seriesname).not_to eq(seriestitle)
            if matcher == true
                puts "Okay, it's very hard to be equal. :("
            else
                puts "Nice one. It's very hard coincidence! :)"
            end
        end
    end
end