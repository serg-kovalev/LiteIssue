LiteIssue::Application.routes.draw do
  devise_for :users

  root 'tasks#index'

  post '/comment' => 'comments#create'

  get '/task/:id' => 'tasks#show', :as => 'task_show'
  get '/tag/:tag_name' => 'tasks#tag', :as => 'tag'
  post '/task' => 'tasks#create'

  get '/project/new' => 'projects#new'
  get '/project/:id' => 'projects#show', :as => 'project_show'
  post '/project' => 'projects#create', :as => 'project'
end
