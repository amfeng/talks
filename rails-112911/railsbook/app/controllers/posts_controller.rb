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

  def add_comment
    # FIXME: Now You Try, write method for adding comments per post
    # Remember that all of the database/object manipulations should be
    # handled in the model - "fat model, skinny controller"
  end

  def delete_comment
    # FIXME: Now You Try, write method for deleting comments per post
    # Remember that all of the database/object manipulations should be
    # handled in the model - "fat model, skinny controller"
  end
end
