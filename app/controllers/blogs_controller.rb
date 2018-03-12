class BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_blog, only: [:show, :edit, :update, :destroy]

    def index
        @blogs = Blog.all.paginate(page: params[:page])
    end

    def show
       @comment = @blog.comments.new
    end

    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            UserMailer.welcome_email.deliver
            redirect_to @blog, notice: "saved"
        else
            render "new"
        end
    end

    def new
        @blog = Blog.new
    end

    def update
        if @blog.update(blog_params)
          redirect_to @blog
        else
          render 'edit'
        end
    end

    def destroy
        @blog.destroy
        flash[:notice] = "Delete success"
        redirect_to blogs_path
    end

    private

    def find_blog
        @blog = Blog.find(params[:id])
    end

    def blog_params
        params.require(:blog).permit(:title, :text, :image, :image_cache)
    end
end
