# == Route Map
#
#          Prefix Verb   URI Pattern                        Controller#Action
#            root GET    /                                  home#index
#  api_v1_sign_in POST   /api/v1/sign_in(.:format)          api/v1/sessions#create {:format=>:json}
# api_v1_sign_out DELETE /api/v1/sign_out(.:format)         api/v1/sessions#destroy {:format=>:json}
#    api_v1_users GET    /api/v1/users(.:format)            api/v1/users#index {:format=>:json}
#                 POST   /api/v1/users(.:format)            api/v1/users#create {:format=>:json}
#     api_v1_user GET    /api/v1/user(.:format)             api/v1/users#show {:format=>:json}
#          api_v1 GET    /api/v1/weather/:zipcode(.:format) api/v1/weather#show {:format=>:json}
#

Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    namespace :v1 do
      post   'sign_in'  => 'sessions#create'
      delete 'sign_out' => 'sessions#destroy'
      resources :users, only: [:index, :create, :show]
      #get "user", to: "users#show"
      get "weather/:zipcode", to: "weather#show"
      get '/zipcode_suggestions', to: 'zipcode_suggestions#index'

    end
  end

end
