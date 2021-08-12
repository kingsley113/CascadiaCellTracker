Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	# Cells
	# Users
	# Quests
	# Regions
	# Comments
	# Task

	resources :users, only: [:show] do
		resources :cells, only: [:show, :index] 
	end

	resources :cells, only: [:show, :index] do
		resources :tasks, only: [:show, :edit, :index, :new]
	end

	resources :cells, :users, :regions, :tasks, :quests 

	root 'welcome#home'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
	get '/signup' => 'users#new'

	post '/cells/:id/tasks/:task_id' => 'tasks#create'

end
