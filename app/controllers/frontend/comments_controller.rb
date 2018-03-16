module Frontend
    class CommentsController < ApplicationController
        protect_from_forgery

        def create
            @blog = Blog.find(params[:blog_id])
            @comment = @blog.comments.new(comment_params)
            if @comment.save
                redirect_to blog_path(@blog)
            else
                redirect_to blog_path(@blog), alert: "This did not save"
            end
        end

        private

        def comment_params
            params.require(:comment).permit(:commenter, :title, :body, :blog_id, :id)
        end
    end
end
