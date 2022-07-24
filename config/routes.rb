Rails.application.routes.draw do
  Healthcheck.routes(self)
  root 'welcome#index'
  get '/blacklisted', to: 'blacklisted#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
