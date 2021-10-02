class NogichecksController < ApplicationController
  
  $question = Question.order("RANDOM()").limit(2)

  def index
  end
  
  def question_1
    @question_1 = $question[0]
  end

  def question_2
    @question_2 = $question[1]
  end
  
  
  
  
  
  private
  
  def option_params
    params.require(:option).permit(:content, :is_answer, :question_id)
  end
  
end