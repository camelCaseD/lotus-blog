module Blog::Controllers::Posts
  class Index
    include Blog::Action

    expose :posts

    def call(params)
      @posts = PostRepository.all
    end
  end

  class Create
    include Blog::Action

    def call(params)

    end
  end

  class Insert
    include Blog::Action

    params do
      param :title, presence: true
      param :body, presence: true
    end

    def call(params)
      redirect_to '/posts/new' unless params.valid?

      post = PostRepository.create(Post.new(body: params[:body], title: params[:title]))

      redirect_to routes.path(:posts_show, id: post.id)
    end
  end

  class Delete
    include Blog::Action

    params do
      param :id, presence: true, type: Integer
    end

    def call(params)
      redirect_to '/' unless params.valid?

      PostRepository.delete(PostRepository.find(params[:id]))

      redirect_to '/'
    end
  end

  class Edit
    include Blog::Action

    params do
      param :id, presence: true, type: Integer
    end

    expose :post

    def call(params)
      redirect_to '/' unless params.valid?

      @post = PostRepository.find(params.id)
    end
  end

  class Update
    include Blog::Action

    params do
      param :id, presence: true, type: Integer
      param :title, presence: true
      param :body, presence: true
    end

    def call(params)
      redirect_to routes.path(:posts_edit, id: params.id) unless params.valid?

      post = PostRepository.find(params.id)
      post.update(body: params.body, title: params.title)
      PostRepository.update(post)

      redirect_to routes.path(:posts_show, id: params.id)
    end
  end

  class Show
    include Blog::Action

    params do
      param :id, presence: true, type: Integer
    end

    expose :post

    def call(params)
      redirect_to '/' unless params.valid?

      @post = PostRepository.find(params.id)
    end
  end
end
