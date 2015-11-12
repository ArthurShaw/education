class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if resource.save
      resource.add_role 'speaker'
    end
  end

end