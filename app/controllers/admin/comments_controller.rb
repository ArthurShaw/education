class Admin::CommentsController < ApplicationController
  before_action { check_permission(:admin) }
  before_action :find_comment, only: :destroy

  def new
    @comment = Comment.new
  end

  def show

  end

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = current_user.id
    workshop_id = params[:workshop_id]
    @workshop = Workshop.find(params[:id])
    @comment.workshop_id = workshop_id
    if @comment.save
      UserMailer.new_comment_email(@workshop).delivaer_now
      redirect_to admin_workshop_path(workshop_id)
    else
      redirect_to admin_workshop_path(workshop_id)
    end
  end

  def destroy
    @comment.destroy
    redirect_to admin_workshop_path(params[:workshop_id])
  end


  private

  def comments_params
    params.require(:comment).permit(:text)
  end

  def find_comment
    @comment = Comment.find(params[:id])
    render_404 unless @comment
  end


end
