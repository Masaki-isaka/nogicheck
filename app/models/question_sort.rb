class QuestionSort < ApplicationRecord
  belongs_to :question
  has_one :judge, dependent: :destroy
end
