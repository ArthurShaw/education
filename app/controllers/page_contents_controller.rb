class PageContentsController < ApplicationController

  def edit
    @content = PageContent.find(params[:id])
  end

  def update
    @content = PageContent.find(params[:id])
    @content.update(page_contents_params)
    redirect_to root_path
  end

  private
  def page_contents_params
    params.require(:page_content).permit(:content, :content_en)
  end

end
