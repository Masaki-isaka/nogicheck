class NogichecksController < ApplicationController

  def index
  end

  def sort
    @sort = params[:sort].to_i
    user_id = session[:user_id]

    if @sort == 3
      redirect_to "/nogichecks/result"
    end

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

  def result
    @maniac = "MAX"
    @result = "正真正銘のオタクです"
  end

  private

  def option_params
    params.require(:option).permit(:content, :is_answer, :question_id)
  end
  
  def detect_device
    case request.user_agent
    when /iPhone/
      request.variant= :mobile
    when /Android/
      request.variant= :mobile
    end
  end
end
