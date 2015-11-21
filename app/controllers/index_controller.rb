class IndexController < ApplicationController

  def index
    @about_conference_content = PageContent.find(1)
    @why_kfu_content = PageContent.find(2)
    @org_comitee_content = PageContent.find(3)
  end

  def contacts
    @content = PageContent.find(2)
  end

end
