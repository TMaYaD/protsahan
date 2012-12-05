Protsahan::Application.routes.draw do
  root :to => 'articles#show', :id => 'home'
  match '/pages/*id' => 'high_voltage/pages#show', :as => :page, :format => false
  match '/*id' => 'articles#show', :as => :article, :format => false
end
