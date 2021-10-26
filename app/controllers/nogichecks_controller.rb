class NogichecksController < ApplicationController

  def index
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
    @judge = Judge.new

    ##診断結果
    if @sort == 3
      @maniac = "MAX"
      @result = "正真正銘のオタクです"
      @answer = Option.joins(question: :question_sorts).where(question_sorts: {user_id: user_id, sort: [1,2]}, is_answer: true)
      render :result  
    end
  end

  def create
    question_sort_ids = QuestionSort.where(sort: [1,2]).ids
    if params[:sort] == "1"
      puts "テスト"
      Judge.create!(is_answer: params[:is_answer], question_sort_id: question_sort_ids[0] )
    end
    if params[:sort] == "2"
      Judge.create!(is_answer: params[:is_answer], question_sort_id: question_sort_ids[1] )
    end
  end

  def result
  end

  private

  def option_params
    params.require(:option).permit(:content, :is_answer, :question_id)
  end

  def judge_params
    params.permit(:is_answer).merge(:question_sort_id)
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
