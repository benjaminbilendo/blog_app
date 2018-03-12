class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_blog

    def create
        if Comment.filter(params[:comment][:body])
           flash[:notice] = "You cannot dislike my blog"
        end
        @comment = @blog.comments.new(comment_params)
        if @comment.save
           redirect_to blog_path(@blog)
        else
           redirect_to blog_path(@blog)
           flash[:notice] = "This did not save"
        end
    end

    def edit
        @comment = @blog.comments.find(params[:id])
    end

    def update
        @comment = @blog.comments.find(params[:id])
        if @comment.update(comments_params)
            redirect_to blog_path(@blog)
        else
            render 'edit'
        end
    end

    def destroy
        @comment = @blog.comments.find(params[:id])
        @comment.destroy
        redirect_to blogs_path(@blog, notice: "Delete success")
    end

    private

    def find_blog
        @blog = Blog.find(params[:blog_id])
    end

    def comment_params
        params.require(:comment).permit(:commenter, :title, :body, :blog_id, :id)
    end
end
