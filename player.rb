class Player
  attr_reader :name, :lives
  MAX_LIVES = 3

  def initialize(name, lives = 3)
    @name = name
    @lives = 3
  end

  def dead?
    @lives <= 0
  end

  def summary
    "#{name}: #{@lives}/#{MAX_LIVES}"
  end

  def decrement_score
    @lives -= 1
  end

end
