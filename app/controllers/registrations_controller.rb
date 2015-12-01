class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if resource.save
      resource.add_role 'speaker'
    end
  end

  def after_update_path_for(resource)
    profile_path
  end

end