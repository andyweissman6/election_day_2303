class Election
  attr_reader :year

  def initialize(year)
    @year = year
    @races = []
  end

  def year
    @year
  end

  def races
    @races
  end

  def add_race(race)
    @races << race
  end

  def candidates
    total_candidates = []
    @races.each do |race|
      total_candidates.concat(race.candidates)
    end
    total_candidates
  end

  def vote_counts
    

    
  end
end