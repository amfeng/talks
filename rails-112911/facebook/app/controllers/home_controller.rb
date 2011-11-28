class HomeController < ApplicationController
  def index
    if @current_user
      @posts = @current_user.posts
      render :index
    else
      render :index_logged_out
    end
  end

  def login
  end

end
