class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.child_comments.build
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to new_post_path
  end

  def update
    @post = Post.all.find(params[:id])
    @post.update(post_params)

    redirect_to new_post_path
  end

  def edit
    @post = Post.all.find(params[:id])
  end

  def post_params
    user_id = Post.find(params[:id]).authors.ids
    params
      .require(:post)
      .permit(:title, :body, :tags_on_authored_post_ids => [], :author_ids => [],:child_comments_attributes => [:body,:id,:_destroy,user_id])
  end

end
