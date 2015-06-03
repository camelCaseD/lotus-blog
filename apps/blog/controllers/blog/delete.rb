module Blog::Controllers::Posts
  class Delete
    include Blog::Action

    params do
      param :id, presence: true, type: Integer
    end

    def call(params)
      redirect_to '/' unless params.valid?

      PostRepository.delete(PostRepository.find(params.id))

      redirect_to '/'
    end
  end
end
