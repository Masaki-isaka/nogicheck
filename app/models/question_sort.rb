class QuestionSort < ApplicationRecord
  belongs_to :question
  has_one :judge
end
