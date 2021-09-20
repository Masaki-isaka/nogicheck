class NogichecksController < ApplicationController
  def index
  end

  def question_1
    @question = Question.find(1)
    @option = Option.where(question_id: 1)
  end

end
