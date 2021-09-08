Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'rooms#index'
  resources :rooms do
    resources :bookings
  end


  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, path: 'v1' do
      get '/all_rooms_availability' => 'rooms#all_rooms_availability'
      get '/room_availability' => 'rooms#room_availability'
      post '/bookings' => 'bookings#create'
    end
  end

end
