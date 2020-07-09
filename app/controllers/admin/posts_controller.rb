class Admin::PostsController < ApplicationController
  before_action :if_not_admin,only:[:new,:edit,:create,:update,:destroy]
  
  def index
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = "記事の追加に成功しました"
    else
      flash[:alert] = "記事の追加に失敗しました。"
      redirect_to new_admin_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = "記事の更新に成功しました"
    else
      redirect_to edit_admin_post_path(@post)
      flash[:alert] = "記事の更新に失敗しました"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "記事の削除に成功しました"
      redirect_to root_path
    else
      flash[:alert] = "記事の削除に失敗しました"
      redirect_to edit_admin_post_path(@post)
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :img,
      :category
    )
  end

end
