Rails.application.routes.draw do
  scope module: :web do
    root to: 'welcome#show'
    resource :session
    resources :registrations
    resources :events
    resource :calendar
  end

  namespace :web_api, defaults: {format: :json} do
    resources :event_objects
  end
end
