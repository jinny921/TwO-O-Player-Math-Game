class Question

  attr_reader :answer
  def initialize
    @first_num = rand(1...20)
    @second_num = rand(1...20)
    @answer = @first_num + @second_num
  end
  
  def print_question
    "What does #{@first_num} plus #{@second_num} equal to?"
  end
  
  def correct?(user_input)
    (user_input == @answer) ? true : false
  end


end
