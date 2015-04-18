Rails.application.routes.draw do

  devise_for :users#, :administrators, :coaches

  root 'homepage#index'

  resource :dashboard, :only => :show

  resources :sessions, :only => [], :path => "calendar/sessions" do
    collection do
      get :get_sessions
    end
  end

  mount FullcalendarEngine::Engine => "/calendar"

  resource :dashboard, :only => :show
end
