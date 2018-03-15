module Frontend
    class BlogsController < ApplicationController
        protect_from_forgery

        def index
            @blogs = Blog.published_posts.paginate(page: params[:page])
        end

        def show
           @blog = Blog.find(params[:id])
           @comment = @blog.comments.new
        end
    end
end
