module Backend
    class BlogsController < ApplicationController
        before_action :find_blog, only: [:show, :edit, :update, :destroy, :active]

        def index
            @blogs = Blog.all.paginate(page: params[:page])
        end

        def create
            @blog = Blog.new(blog_params)
            if @blog.save
                redirect_to backend_blogs_path, notice: "Success!"
            else
                render "new"
            end
        end

        def edit
        end

        def new
            @blog = Blog.new
        end

        def update
            if @blog.update(blog_params)
              redirect_to backend_blogs_path
            else
              render 'edit'
            end
        end

        def destroy
            @blog.destroy
            flash[:notice] = "Delete success"
            redirect_to backend_blogs_path
        end

        def change_size
            Resque.enqueue(ImagesWorker)
            redirect_to backend_blogs_path, notice: "worker enqueued"
        end

        private

        def find_blog
            @blog = Blog.find(params[:id])
        end

        def blog_params
            params.require(:blog).permit(:title, :text, :image, :image_cache, :active, :notified, :wordcount, :whitespacecount, :charactercount)
        end
    end
end
