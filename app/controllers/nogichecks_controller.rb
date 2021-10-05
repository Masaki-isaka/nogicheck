class NogichecksController < ApplicationController

  def index
  end
  
  def judge
    question = [1,2].shuffle
    @question_1 = Question.find(question[0])
    @question_2 = Question.find(question[0])
    render "nogichecks/#{params[:name]}"
  end
  
  private
  
  def option_params
    params.permit(:content, :is_answer, :question_id)
  end
  
end