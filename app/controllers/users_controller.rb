class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers, :likings]

  def index
    @users = User.all.page(params[:page])
    #.page(params[:page])はページネーション
  end

  def show
    @user = User.find(params[:id])
    flash[:danger] = "プロフィールを入力してください。" if @user.profile.blank?
    @posts = @user.posts.order('created_at DESC').page(params[:page])
    counts(@user)
  end
  
  def edit
    @user = User.find(params[:id])
  end

 def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to @user
   else
    render :edit
   end
 end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      flash[:success] = 'ユーザー登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録を失敗しました。'
      render :new
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def likings
    @user = User.find(params[:id])
    @likings = @current_user.likings.order('created_at DESC').page(params[:page])
    counts(@user)
  end
  
  # def photo
  #   @user = User.find(params[:id])
  #   @photo = @user.photo
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :image)
  end


end