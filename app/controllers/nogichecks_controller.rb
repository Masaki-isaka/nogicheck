class NogichecksController < ApplicationController

  @@question = [1,2].to_a.sample(2)

  def index
  end
  
  def question_1
    @question_1 = Question.find(@@question[0])
  end

  def question_2
    @question_2 = Question.find(@@question[1])
  end
  
  
  
  
  
  private
  
  def option_params
    params.permit(:content, :is_answer, :question_id)
  end
  
end