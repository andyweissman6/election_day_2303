require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  describe "Race" do
    it "exists" do
      race = Race.new("Texas Governor")

      expect(race).to be_a(Race)
    end

    it "has attributes" do
      race = Race.new("Texas Governor")
      expect(race.office).to eq("Texas Governor")
      expect(race.candidates).to eq([])
    end

    it "has candidates that can be registered" do
      race = Race.new("Texas Governor")

      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)

      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      expect(race.candidates).to eq([candidate1, candidate2])
    end
  end
end
