Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "nogichecks#index"
  get "nogichecks/index", to: "nogichecks#index"
  get "nogichecks/question_1"
  get "nogichecks/question_2", to: "nogichecks#judge"
end
