Rails.application.routes.draw do
  resources :contact_messages, only: %i(new create)
end
