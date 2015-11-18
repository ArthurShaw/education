class ListenerRequestsController < ApplicationController

  def index
    @requests = ListenerRequest.all
  end

  def show

  end

  def new
    @listener_request = ListenerRequest.new
  end

  def success

  end

  def create
    @listener_request = ListenerRequest.new(listener_params)
    if @listener_request.save
      redirect_to listener_request_success_path(@listener_request)
    else
      render 'new', :status => :bad_request
    end
  end

  def excel
    spreadsheet_name = 'Заявки слушателей'

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => spreadsheet_name
    sheet1.row(0).replace [t('listener_requests.first_name'),
                           t('listener_requests.last_name'),
                           t('listener_requests.middle_name'),
                           t('listener_requests.email'),
                           t('listener_requests.country'),
                           t('listener_requests.city'),
                           t('listener_requests.phone')]
    @requests = ListenerRequest.all
    @requests.each_with_index  { |req, i|
      sheet1.row(i+1).replace [req.first_name, req.last_name, req.middle_name, req.email, req.country, req.city, req.phone]
    }

    export_file_path = [Rails.root, "public", "uploads", "exports", "#{ spreadsheet_name }_#{ DateTime.now.to_s }.xls"].join("/")
    book.write export_file_path
    send_file export_file_path, :content_type => "application/vnd.ms-excel", :disposition => 'inline'
  end

  private

  def listener_params
    params.require(:listener_request).permit(:first_name, :last_name, :middle_name, :email, :country, :city, :phone)
  end
end
