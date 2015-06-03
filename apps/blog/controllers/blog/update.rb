module Blog::Controllers::Posts
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
end
