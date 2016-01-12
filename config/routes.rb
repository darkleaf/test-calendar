Rails.application.routes.draw do
  scope module: :web do
    root to: 'welcome#show'
    resource :session
    resources :registrations
    resources :events
    resource :calendar
  end
end
