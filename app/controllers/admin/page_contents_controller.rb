class Admin::PageContentsController < ApplicationController
  before_action { check_permission(:admin) }
  before_action :find_page_content, only: [:edit, :update, :show]

  def index
    @contents = PageContent.where(:content_type => PageContent.content_types[:text])
  end

  def edit
  end

  def show

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

end

