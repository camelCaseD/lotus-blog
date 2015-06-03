module Blog::Views::Posts
  class Show
    include Blog::View

    def link_delete(id)
      _raw %(<form action="#{routes.path(:posts_delete, id: id)}" method="post"><input type="hidden" name="_method" value="delete" /><input class="faux-link" type="submit" value="Delete" /></form>)
    end

    def link_edit(id)
      _raw %(<a href="#{routes.path(:posts_edit, id: id)}">Edit Post</a>)
    end
  end
end
