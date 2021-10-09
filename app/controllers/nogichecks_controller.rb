class NogichecksController < ApplicationController

  byebug
  @@question = Question.order("RANDOM()").limit(2)
  

  def index
  end
  
  def judge
    @question_1 = @@question[0]
    @question_2 = @@question[0]
    render "nogichecks/#{params[:name]}"
  end
  
  private
  
  def option_params
    params.permit(:content, :is_answer, :question_id)
  end
  
end