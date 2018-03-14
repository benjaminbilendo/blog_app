class BlogsController < ApplicationController
    protect_from_forgery
    before_action :authenticate_user!
    before_action :find_blog, only: [:show, :edit, :update, :destroy, :active]

    def index
        @blogs = Blog.all.paginate(page: params[:page])
        render template: "/blogs/frontend/index"
    end

    def show
       @comment = @blog.comments.new
       render template: "/blogs/frontend/show"
    end

    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            redirect_to @blog, notice: "saved"
        else
            render "new"
        end
    end

    def edit
        render template: "/blogs/backend/edit"
    end

    def new
        @blog = Blog.new
        render template: "/blogs/backend/new"
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

    def active
        @blog.activate
        @blog.save
        Blog.send_subscription_emails
        render template: "/blogs/backend/active"
    end

    private

    def find_blog
        @blog = Blog.find(params[:id])
    end

    def blog_params
        params.require(:blog).permit(:title, :text, :image, :image_cache)
    end
end
