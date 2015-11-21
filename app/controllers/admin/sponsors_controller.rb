class Admin::SponsorsController < ApplicationController

  before_action :find_sponsor, only: [:update, :destroy, :edit]
  before_action :check_permission

  def index
    @sponsor_categories = SponsorCategory.all
  end

  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      redirect_to admin_sponsors_path
    else
      render 'new', :status => :bad_request
    end
  end

  def destroy
    @sponsor.destroy
    redirect_to admin_sponsors_path
  end

  def edit
  end

  def update
    if @sponsor.update(sponsor_params)
      redirect_to admin_sponsors_path
    else
      render 'edit'
    end
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:name, :url, :image, :sponsor_category_id)
  end

  def find_sponsor
    @sponsor = Sponsor.find(params[:id])
    render_404 unless @sponsor
  end

  def check_permission
    render_403 unless current_user.has_role? :admin
  end


end
