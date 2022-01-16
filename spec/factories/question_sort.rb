FactoryBot.define do
  factory :question_sort do
    sort { 1 }
    user_id { "abcde" }
    association :question
  end
end