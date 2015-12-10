class Section < ActiveRecord::Base
  has_many :workshops
  has_many :schedule_intervals
  has_and_belongs_to_many :events

  def title_localized
    if I18n.locale == :ru
      title
    else
      title_en
    end
  end
end
