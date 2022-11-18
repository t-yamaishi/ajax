class CommentsController < ApplicationController
  before_action :set_blog

  def create
    @comment = @blog.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        format.js { render :index }
      end
    end
  end


  def edit
    @comment = @blog.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.html { redirect_to @blog }
      format.js { render :edit }
    end
  end

  def update
    @comment = @blog.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :index }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
      @comment.destroy!
      respond_to do |format|
        flash.now[:notice] = 'コメントが削除されました'
        format.js { render :index }
      end
  end
  private

  def comment_params
    params.require(:comment).permit(:description, :blog_id)
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
