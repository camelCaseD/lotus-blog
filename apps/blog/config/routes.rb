# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
#
#
# This route will look for `Web::Controllers::Home::Index` action in `apps/web/controllers/home/index.rb`.
# Please, uncomment the following line to have a working example.
get '/', to: 'posts#index'

get '/posts/new', to: 'posts#create', as: :posts_create
post '/posts/new', to: 'posts#insert', as: :posts_insert

get '/posts/delete/:id', to: 'posts#delete', as: :posts_delete

get '/posts/edit/:id', to: 'posts#edit', as: :posts_edit
post '/posts/edit/:id', to: 'posts#update', as: :posts_update

get '/posts/:id', to: 'posts#show', as: :posts_show
