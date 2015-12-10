class IndexController < ApplicationController


  def index
    @page_contents = PageContent.all

    @sponsor_categories = SponsorCategory.all
    @special_quests = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:guest])
    @key_speakers = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:speaker])
    @sections = Section.order(:is_main => :desc, :title => :asc)
  end

  # def contacts
  #   @content = PageContent.second
  # end

  def org_committee
    @content = PageContent.find(3)
    render 'index/usual_content'
  end

  def why_kfu
    @content = PageContent.find(2)
    render 'index/usual_content'
  end

  def information_letter
    @content = PageContent.find(6)
    render 'index/usual_content'
  end

  def cultural_program
    @content = PageContent.find(7)
    render 'index/usual_content'
  end

  def accommodation
    @content = PageContent.find(8)
    render 'index/usual_content'
  end

  def regulations
    @content = PageContent.find(9)
    render 'index/usual_content'
  end
end
