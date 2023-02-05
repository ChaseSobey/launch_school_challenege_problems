
class DNA
  attr_reader :genome
  def initialize(string)
    @genome = string
  end
  
  def hamming_distance(other_genome)
    analysis_length = [genome.size, other_genome.size].min
    hamming_distance_counter = 0
    
    genome[0...analysis_length].chars.each_with_index do |point, index|
      hamming_distance_counter += 1 if point != other_genome[index]
    end

    hamming_distance_counter
  end
end
