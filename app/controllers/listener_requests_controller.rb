class ListenerRequestsController < ApplicationController

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
      redirect_to listener_request_success_path(@listener_request)
    else
      render 'new', :status => :bad_request
    end
  end

  private

  def listener_params
    params.require(:listener_request).permit(:first_name, :last_name, :middle_name, :email, :country, :city, :phone)
  end
end
