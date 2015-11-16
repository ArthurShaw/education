class Role < ActiveRecord::Base

  ADMIN_ROLES = [:admin, :publisher, :speakers_reviewer, :listeners_reviewer]

  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
end
