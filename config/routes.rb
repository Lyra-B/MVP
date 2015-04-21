Rails.application.routes.draw do

  devise_for :users, :administrators, :coaches

  root 'homepage#index'

  resource :dashboard, :only => :show

  resources :sessions, :only => [], :path => "calendar/sessions" do
    collection do
      post :create
      get :get_sessions
    end
    member do
      put "/assign_coach/:coach_id", to: "sessions#assign_coach"
    end
  end
end
