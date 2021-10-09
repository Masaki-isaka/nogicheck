class NogichecksController < ApplicationController

  def index
  end
  
  def judge
  end

  def sort
    @sort = params[:sort].to_i
    user_id = session[:user_id]
    if user_id.blank?
      session[:user_id] = SecureRandom.uuid
      user_id = session[:user_id]
    end
    return redirect_to action: :index if @sort < 1
    if @sort == 1
      QuestionSort.where(user_id: user_id).delete_all
      question_ids = Question.order("RANDOM()").limit(2).pluck(:id)
      question_ids.each.with_index(1) do |question_id, index|
        QuestionSort.create!(user_id: user_id, question_id: question_id, sort: index)
      end
    end
    @question = Question.joins(:question_sorts).find_by(question_sorts: {user_id: user_id, sort: @sort})      
  end
  
  private
  
  def option_params
    params.permit(:content, :is_answer, :question_id)
  end
end