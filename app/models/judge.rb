class Judge < ApplicationRecord
  belongs_to :question_sort, optional: true
end
