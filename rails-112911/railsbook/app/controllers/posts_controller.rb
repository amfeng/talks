class PostsController < ApplicationController
  before_filter :require_user, :only => [:create, :destroy]
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post succesfully created!"
      redirect_back_or_default home_path
    else
      render :action => :new
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy if post
    redirect_back_or_default home_path
  end
end
