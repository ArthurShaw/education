class Admin::PageContentsController < ApplicationController

  def index
    @contents = PageContent.all
  end

  def edit
    @content = PageContent.find(params[:id])
  end

  def update
    @content = PageContent.find(params[:id])
    @content.update(page_contents_params)
    redirect_to admin_page_contents_path
  end

  private

  def page_contents_params
    params.require(:page_content).permit(:name, :name_en, :content, :content_en, :hidden)
  end

end

