class ApplicationController < ActionController::Base
  $question = Question.order("RANDOM()").limit(2)
  $question_1 = $question[0]
  $question_2 = $question[1]
end
