class AllPostsController < ApplicationController
  def index
    @all_posts = Post.all.page(params[:page]).per(3)
    @all_users = User.all.page(params[:page]).per(3)
  end
end
