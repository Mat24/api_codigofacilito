Rails.application.routes.draw do
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :users
      resources :polls, controller: "my_polls"
   end
 end
end
