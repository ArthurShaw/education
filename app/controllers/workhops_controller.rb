class WorkhopsController

  def new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.user_id = current_user.id
    @workshop.save
    redirect_to profile_path
  end

  private

  def workshop_params
    params.require(:workshop).permit(:title, :description)
  end
end