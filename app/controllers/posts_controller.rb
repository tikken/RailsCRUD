class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def show
        @posts = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, success: "Статья успешно создана"
        else
            render :new, danger: "Статья не создана"
        end
    end

    def edit
    end   

    def update
        if @post.update_attributes(post_params)
        redirect_to @post, success: "Статья успешно обновлена"
        else
            render :edit, danger: "Что-то пошло не так"
        end
    end

    def destroy
        @post.destroy
          redirect_to posts_path, success: "Статья удалена"
    end

    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :summary, :body, :image)
    end

end