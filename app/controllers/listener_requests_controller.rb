class ListenerRequestsController < ApplicationController

  def index
    redirect_to new_listener_request_path
  end

  def new
    @listener_request = ListenerRequest.new
  end

  def success
    @listener_request = ListenerRequest.find(params[:id])
    render_404 unless @listener_request
  end

  def create
    @listener_request = ListenerRequest.new(listener_params)
    if @listener_request.save
      UserMailer.welcome_listener_email(@listener_request).deliver_now
      redirect_to success_listener_request_path(@listener_request)
    else
      render 'new', :status => :bad_request
    end
  end

  private

  def listener_params
    params.require(:listener_request).permit(:first_name, :last_name, :email, :country, :city, :phone, :arrival, :departure, :need_hotel, :work_place, :occupation, :hotel_id)
  end
end
