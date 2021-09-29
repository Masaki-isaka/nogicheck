Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "nogichecks/index"
  get "nogichecks/index", to: "nogichecks#index"
  get "nogichecks/question_1"
  get "nogichecks/question_2"
  post "nogichecks/index", to: "nogichecks#judge"
end
