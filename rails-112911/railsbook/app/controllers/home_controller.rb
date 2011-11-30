class HomeController < ApplicationController
  def index
    if @current_user
      @users = User.all
      @users.delete current_user

      # FIXME: Now You Try, Eager Loading
      friends = @current_user.friends

      @posts = ( [@current_user] | friends).collect(&:posts).flatten.sort_by(&:created_at)
      @posts.reverse!
      render :index
    else
      render :index_logged_out
    end
  end

  def login
  end

end
