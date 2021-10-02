# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
    get "nogichecks/index"
    get "nogichecks/index", to: "nogichecks#index"
    get "nogichecks/question_1", to: "nogichecks#question_1"
    get "nogichecks/question_2", to: "nogichecks#question_2"
end