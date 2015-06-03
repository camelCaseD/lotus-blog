module Blog::Controllers::Posts
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
end
