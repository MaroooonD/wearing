class AllPostsController < ApplicationController
  def index
    @all_posts = Post.all.order('created_at DESC').page(params[:page]).per(5)
  end
end
