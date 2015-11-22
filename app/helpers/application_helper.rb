module ApplicationHelper

  def request_controller
    params[:controller]
  end

  def admin_controller?
    request_controller.start_with? 'admin'
  end

end
