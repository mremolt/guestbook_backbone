GuestbookBackbone::Application.routes.draw do
  resources :entries, :format => :json

  root :to => 'home#index'

end
#== Route Map
# Generated on 04 Feb 2012 14:18
#
#            POST   /entries(.:format)          entries#create {:format=>:json}
#  new_entry GET    /entries/new(.:format)      entries#new {:format=>:json}
# edit_entry GET    /entries/:id/edit(.:format) entries#edit {:format=>:json}
#      entry GET    /entries/:id(.:format)      entries#show {:format=>:json}
#            PUT    /entries/:id(.:format)      entries#update {:format=>:json}
#            DELETE /entries/:id(.:format)      entries#destroy {:format=>:json}
#       root        /                           home#index
