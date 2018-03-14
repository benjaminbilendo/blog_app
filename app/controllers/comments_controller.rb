class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_blog, only: [:edit, :update, :destroy, :create]
    before_action :find_comment, only: [:edit, :update, :destroy]


    def create
        @comment = @blog.comments.new(comment_params)
        if @comment.save
           redirect_to blog_path(@blog)
        else
           redirect_to blog_path(@blog), alert: "This did not save"
        end
    end

    def edit
    end

    def update
        if @comment.update(comments_params)
            redirect_to blog_path(@blog)
        else
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        redirect_to blogs_path(@blog, notice: "Delete success")
    end

    private

    def find_blog
        @blog = Blog.find(params[:blog_id])
    end

    def find_comment
        @comment = @blog.comments.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:commenter, :title, :body, :blog_id, :id)
    end
end
