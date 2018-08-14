class Problem
  attr_reader :num1, :num2

  SEED_NUM = 10

#   def initialize
#     @num1 = 0
#     @num2 = 0
#   end

  def generate_problem
    @num1 = rand(SEED_NUM);
    @num2 = rand(SEED_NUM);
    return "What is #{num1} x #{num2}"
  end

  def check_answer?(ans)
    if ans.to_i == @num1 * @num2
        true
    else
        false
    end
  end

end

# p1 = Problem.new
# p p1.generate_problem
# ans = gets.chomp
# puts p1.num1, p1.num2
# puts p1.check_answer?(ans)