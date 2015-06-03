module Blog::Controllers::Posts
  class Index
    include Blog::Action

    expose :posts

    def call(params)
      @posts = PostRepository.all
    end
  end
end
