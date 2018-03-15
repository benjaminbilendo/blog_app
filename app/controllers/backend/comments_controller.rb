module Backend
    class CommentsController < ApplicationController
        before_action :authenticate_user!
        before_action :find_blog, except: [:index]
        before_action :find_comment, except: [:index]


        def index
            @comments = Comment.all.paginate(page: params[:page])
        end

        def edit
        end

        def update
            if @comment.update(comment_params)
                redirect_to backend_blog_path(@blog)
            else
                render 'edit'
            end
        end

        def destroy
            @comment.destroy
            redirect_to backend_blog_path(@blog, notice: "Delete success")
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
end
