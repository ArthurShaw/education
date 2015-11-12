class IndexController < ApplicationController

  def index
    @content = PageContent.find(1)
  end

  def contacts
    @content = PageContent.find(2)
  end

end
