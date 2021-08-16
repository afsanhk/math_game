class Question

  def self.get_question_answer 
    output = []
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    output[0] = "What does #{@num1} plus #{@num2} equal?"
    output[1] = [@num1 + @num2]
    output
  end
  
end