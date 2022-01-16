FactoryBot.define do
  factory :option do
    content { "op_test" }
    is_answer { "true" }
    association :question
  end
end