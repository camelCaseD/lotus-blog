module Blog::Views::Posts
  class Index
    include Blog::View
    include Lotus::Helpers

    def posts
      PostRepository.all
    end

    def link_create
      _raw %(<a href="#{routes.path(:posts_create)}">Create Post</a>)
    end

    def link_delete(id)
      _raw %(<a href="#{routes.path(:posts_delete, id: id)}">Delete Post</a>)
    end

    def link_edit(id)
      _raw %(<a href="#{routes.path(:posts_edit, id: id)}">Edit Post</a>)
    end
  end

  class Create
    include Blog::View
  end

  class Edit
    include Blog::View

    def post
      PostRepository.find(locals[:params][:id])
    end

    def edit_action
      routes.path(:posts_update, id: locals[:params][:id])
    end
  end

  class Show
    include Blog::View

    def post
      PostRepository.find(locals[:params][:id])
    end

    def link_delete(id)
      _raw %(<a href="#{routes.path(:posts_delete, id: id)}">Delete Post</a>)
    end

    def link_edit(id)
      _raw %(<a href="#{routes.path(:posts_edit, id: id)}">Edit Post</a>)
    end
  end
end
