class IndexController < ApplicationController


  def index
    @about_conference_content = PageContent.find(1)
    @why_kfu_content = PageContent.find(2)
    @org_committee_content = PageContent.find(3)
    @sponsor_categories = SponsorCategory.all
    @location_json = PageContent.find(4).content

    @special_quests = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:guest])
    @key_speakers = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:speaker])
  end

  def contacts
    @content = PageContent.find(2)

  end

  def org_committee
    @org_committee_content = PageContent.find(3)
  end

  def why_kfu
    @why_kfu_content = PageContent.find(2)
  end
end
