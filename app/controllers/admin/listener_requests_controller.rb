class Admin::ListenerRequestsController < ApplicationController

  before_action { check_permission(:admin) }

  def index
    @requests = ListenerRequest.all
  end

  def excel
    spreadsheet_name = 'Заявки слушателей'

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => spreadsheet_name
    sheet1.row(0).replace [t('listener_requests.first_name'),
                           t('listener_requests.last_name'),
                           t('listener_requests.email'),
                           t('listener_requests.country'),
                           t('listener_requests.city'),
                           t('listener_requests.phone'),
                           t('user_params.work_place'),
                           t('user_params.occupation'),
                           t('arrival'),
                           t('departure'),
                           t('hotel')]
    @requests = ListenerRequest.all
    @requests.each_with_index { |req, i|
      hotel = req.hotel ? req.hotel.title : 'Не требуется'
      sheet1.row(i+1).replace [req.first_name, req.last_name, req.email, req.country, req.city, req.phone, req.work_place, req.occupation, req.arrival, req.departure, hotel]
    }

    export_file_path = [Rails.root, "public", "uploads", "exports", "#{ spreadsheet_name }_#{ DateTime.now.to_s }.xls"].join("/")
    book.write export_file_path
    send_file export_file_path, :content_type => "application/vnd.ms-excel", :disposition => 'inline'
  end


end
