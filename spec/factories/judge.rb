FactoryBot.define do
  factory :judge do
    is_answer { "true" }
    choice { "op_test" }
    association :question_sort
  end
end