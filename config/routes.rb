Rails.application.routes.draw do
  post '/sync', to: 'sync#create'
end
