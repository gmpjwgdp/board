Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'welcome#index'
  root 'root#index'
  get '/topics/:id/messages/index' => 'messages#index'
  resources(:messages)
  resources(:topics)
  # get '/topics'=>'topics#index'
end
