class HomeController < ApplicationController
  def index
    if @current_user
      render :index
    else
      render :index_logged_out
    end
  end

  def login
  end

end
