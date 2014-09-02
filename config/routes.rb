# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do  
  get 'projects/:id/redirecttab', :to => 'redmine_redirecttab#index'
end
