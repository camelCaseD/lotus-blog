module Blog::Controllers::Posts
  class Insert
    include Blog::Action

    params do
      param :title, presence: true
      param :body, presence: true
    end

    def call(params)
      redirect_to '/posts/new' unless params.valid?

      post = PostRepository.create(Post.new(body: params.body, title: params.title))

      redirect_to routes.path(:posts_show, id: post.id)
    end
  end
end
