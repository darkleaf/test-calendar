Rails.application.routes.draw do
  scope module: :web do
    root to: 'welcome#show'
    resource :session
  end
end
