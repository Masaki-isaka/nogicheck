class NogichecksController < ApplicationController
  def index
  end

  def question_1
    @question = Question.find(1)
    @option = Option.where(question_id: 1)
  end

  def judge
    if params[:is_answer] == "true"
      redirect_to nogichecks_index_path
    end
  end 

  private

  def option_params
    params.require(:option).permit(:content, :is_answer, :question_id)
  end

end
