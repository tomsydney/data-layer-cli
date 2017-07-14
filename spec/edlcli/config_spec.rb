require 'helper'

module EagleCli
  describe Config do
    describe ".serialize" do
      it "returns a config hash scoped by profile name" do
        hash = {name: "foo", url: "A", id: "B", secret: "C"}

        result = Config.with(hash).serialize
        expect(result).to eq(
          {"foo" => {url: 'A', id: 'B', secret: 'C'}}
        )
      end
    end

    describe ".valid?" do
      it "returns true when all config attributes are set" do
        hash = {name: "foo", url: "A", id: "B", secret: "C"}
        expect(Config.with(hash).valid?).to eq(true)
      end

      it "returns false with only some attributes are set" do
        hash = {name: "foo", url: "", id: "", secret: nil}
        expect(Config.with(hash).valid?).to eq(false)
      end
    end

    describe ".load" do
      context "when profile is found in config" do
        it "returns a config object to caller from persisted file" do
          name = "foo"
          persisted = {url: "A", id: "B", secret: "C"}
          expect(ConfigFile).to receive(:read).with(name).and_return(persisted)

          result = Config.load(name)
          expect(result.name).to eq( name )
          expect(result.url).to eq( persisted.fetch(:url) )
          expect(result.id).to eq( persisted.fetch(:id) )
          expect(result.secret).to eq( persisted.fetch(:secret) )
        end
      end

      context "when profile is new to system" do
        it "returns an new config with only name set" do
          name = "nothing"
          expect(ConfigFile).to receive(:read).with(name).and_return({})

          result = Config.load(name)
          expect(result.name).to eq( name )
          expect(result.url).to eq( '' )
        end
      end
    end
  end
end
