require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  describe "Election" do
    it "exists" do
      election = Election.new("2023")

      expect(election).to be_a(Election)
    end

    it "has attributes" do
      election = Election.new("2023")
      expect(election.year).to eq("2023")
    end

    it "has races & can add races" do
      election = Election.new("2023")
      race = Race.new("Texas Governor")

      expect(election.races).to eq([])
      election.add_race(race)
      expect(election.races).to eq([race])


    end

    it "has candidates" do
      election = Election.new("2023")
      race = Race.new("Texas Governor")
      election.add_race(race)
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      expect(election.candidates).to eq([candidate1, candidate2])
    end

    it "can accumulate votes" do
      election = Election.new("2023")
      race = Race.new("Texas Governor")
      election.add_race(race)
      diana = Candidate.new({name: "Diana D", party: :democrat})
      roberto = Candidate.new({name: "Roberto R", party: :republican})

      diana.vote_for!
      diana.vote_for!
      roberto.vote_for!

      expect(election.vote_counts).to eq[{"Diana D" => 2, "Roberto R" => 1}]
    end
    

    
  end
end
