Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    post '/questions', to: 'questions#create'
  end
end
