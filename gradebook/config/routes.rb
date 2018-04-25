Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'Teacher', at: 'teacher/auth'

  mount_devise_token_auth_for 'Admin', at: 'admin/auth'

  mount_devise_token_auth_for 'Student', at: 'student/auth'
  as :student do
    # Define routes for Student within this block.
  #  resources :subjects, only: [:index, :show]
    #resources :grades, only: [:index, :show]
  end
  as :admin do
    # Define routes for Admin within this block.
  end
  as :teacher do
    # Define routes for Teacher within this block.
  end


  get '/grades', to: 'grades#index'             #get all grades
  post '/grades', to: 'grades#create'           #create grade
  put '/grades/:id', to: 'grades#update'        #edit grade
  delete '/grades/:id', to: 'grades#destroy'    #delete grade
  get '/grades/:id', to: 'grades#show'          #show one grade


  get '/subjects', to: 'subjects#index'             #get all subjects
  post '/subjects', to: 'subjects#create'           #create subject
  put '/subjects/:id', to: 'subjects#update'        #edit subject
  delete '/subjects/:id', to: 'subjects#destroy'    #delete subject
  get '/subjects/:id', to: 'subjects#show'          #show one subject

  get '/groups', to: 'groups#index'             #get all groups
  post '/groups', to: 'groups#create'           #create group
  put '/groups/:id', to: 'groups#update'        #edit group
  delete '/groups/:id', to: 'groups#destroy'    #delete group
  get '/groups/:id', to: 'groups#show'          #show one group

  get '/subjectgroups', to: 'subjectgroups#index'             #get all subjectgroups
  post '/subjectgroups', to: 'subjectgroups#create'           #create subjectgroup
  put '/subjectgroups/:id', to: 'subjectgroups#update'        #edit subjectgroup
  delete '/subjectgroups/:id', to: 'subjectgroups#destroy'    #delete subjectgroup
  get '/subjectgroups/:id', to: 'subjectgroups#show'          #show one subjectgroup

  put '/teacher_auth', to:'teacher#update'
  put '/student_auth', to:'student#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
