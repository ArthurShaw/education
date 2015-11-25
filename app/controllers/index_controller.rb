class IndexController < ApplicationController

  def index
    @about_conference_content = PageContent.first
    @why_kfu_content = PageContent.second
    @org_comitee_content = PageContent.third
    @sponsor_categories = SponsorCategory.all
    @special_quests = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:guest])
    @key_speakers = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:speaker])
    @sections = Section.order(:is_main => :desc, :title => :asc)
  end

  def contacts
    @content = PageContent.second
  end

end
