class NogichecksController < ApplicationController
  def index
  end

  def question_1
    @question = Question.order("RANDOM()").first
  end

  def question_2
  end


  def judge
    if params[:name] == "question_1"
      puts "テスト"
      @question = Question.order("RANDOM()").first
      render "question_1"
    end
  end





  private

  def option_params
    params.require(:option).permit(:content, :is_answer, :question_id)
  end

end
