class NogichecksController < ApplicationController
  def index
  end

  def question_1
    @question = Question.order("RANDOM()").first
    @option = Option.where(question_id: 1)
  end

  def question_2
    @question = Question.order("RANDOM()").first
    @option = Option.where(question_id: 1)
  end

  def judge
  end 

  private

  def option_params
    params.require(:option).permit(:content, :is_answer, :question_id)
  end

end
