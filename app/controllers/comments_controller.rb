class CommentsController < ApplicationController
  
  before_action :set_post
  
  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    # user idが1の人がログインしていたら
    # current_user.id => 1がかえってくる
    # @comment.user_id に current_user.idをせっとしたい
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントを投稿しました。"
      redirect_to post_url(@post)
    else
      flash.now[:danger] = "コメントの投稿に失敗しました"
      render 'posts/show'
    end
  end
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content,:image)
  end
  
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # before_action :set_comment, only: [:index, :new, :create]
  
  
  # def index
  #   @post = Post.where(:id => params[:post_id]).first #@postは自分が所属すべきcommentを知ることができる。
  #   @comments = @post.comments.all.page(params[:page])
  # end

  # def new
  #   @post = Post.where(:id => params[:post_id]).first
  #   @comment = @post.comments.build
  # end

  # def create
  #   @post = Post.where(:id => params[:post_id]).first
  #   @comment = @post.comments.build(comment_params)
    
  #   if @comment.save
  #     flash[:success] = "コメントを投稿しました。"
  #     redirect_to [@comment,@post]
  #   else
  #     flash.now[:danger] = "コメントの投稿に失敗しました"
  #     render :show
  #   end
  # end
  
  # private
  
  # def set_comment
  #   @post = Post.where(:id => params[:post_id]).first
  #   @comment = @post.comments.where(:id => params[:id]).first
  # end
  
  # end
