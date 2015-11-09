Rails.application.routes.draw do
  namespace :api do
    post '/questions', to: 'questions#create'
  end
end
