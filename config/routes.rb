# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
    get "nogichecks/index"
    get "nogichecks/index", to: "nogichecks#index"
    get "nogichecks/:sort", to: "nogichecks#sort"
    post "nogichecks/:sort", to: "nogichecks#sort"
end
