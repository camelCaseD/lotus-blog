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
      _raw %(<form action="#{routes.path(:posts_delete, id: id)}" method="post"><input type="hidden" name="_method" value="delete" /><input class="faux-link" type="submit" value="Delete" /></form>)
    end

    def link_edit(id)
      _raw %(<a href="#{routes.path(:posts_edit, id: id)}">Edit Post</a>)
    end

    def path_show(id)
      routes.path(:posts_show, id: id)
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
      _raw %(<form action="#{routes.path(:posts_delete, id: id)}" method="post"><input type="hidden" name="_method" value="delete" /><input class="faux-link" type="submit" value="Delete" /></form>)
    end

    def link_edit(id)
      _raw %(<a href="#{routes.path(:posts_edit, id: id)}">Edit Post</a>)
    end
  end
end
