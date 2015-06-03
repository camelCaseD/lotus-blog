module Blog::Views::Posts
  class Edit
    include Blog::View

    def edit_action
      routes.path(:posts_update, id: locals[:params][:id])
    end
  end
end
