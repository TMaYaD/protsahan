Protsahan::Application.routes.draw do
  root :to => 'high_voltage/pages#show', :id => 'home'
  match '/*id' => 'articles#show', :as => :article, :format => false
end
