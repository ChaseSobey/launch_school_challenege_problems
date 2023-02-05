
class Robot
  @@existing_names = []
  attr_accessor :name
  
  def initialize
    name = ''
    loop do
      2.times do
        name << ('A'..'Z').to_a.sample.to_s
      end
      3.times do
        name << ('0'..'9').to_a.sample.to_s
      end
      break unless @@existing_names.include?(name)
      name = ''
    end
    @name = name
    
    @@existing_names << @name
  end
  
  def self.existing_names
    @@existing_names
  end
  
  def reset
    @@existing_names.delete(self.name)
    name = ''
    loop do
      2.times do
        name << ('A'..'Z').to_a.sample.to_s
      end
      3.times do
        name << ('0'..'9').to_a.sample.to_s
      end
      break unless @@existing_names.include?(name)
      name = ''
    end
    
    self.name = name
    @@existing_names << self.name
  end
end
