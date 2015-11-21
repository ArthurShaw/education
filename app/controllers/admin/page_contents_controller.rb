class Admin::PageContentsController < ApplicationController
  before_action :check_permission
  before_action :find_page_content, only: [:edit, :update]

  def index
    @contents = PageContent.all
  end

  def edit

  end

  def update

    @content.update(page_contents_params)
    redirect_to admin_page_contents_path
  end

  private

  def page_contents_params
    params.require(:page_content).permit(:name, :name_en, :content, :content_en, :hidden)
  end

  def find_page_content
    @content = PageContent.find(params[:id])
    render_404 unless @content
  end

  def check_permission
    render_403 unless current_user.has_role? :admin
  end
end

