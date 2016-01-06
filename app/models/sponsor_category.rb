class SponsorCategory < ActiveRecord::Base
  has_many :sponsors, dependent: :nullify
end
