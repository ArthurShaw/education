class Hotel < ActiveRecord::Base
  has_many :users, dependent: :nullify
  has_many :listener_requests, dependent: :nullify
  validates :title, presence: true

  def title_localized
    if I18n.locale == :ru
      title
    else
      title_en
    end
  end
end
