class Admin::SponsorsController < ApplicationController

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
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy
    redirect_to admin_sponsors_path
  end

  private

  def sponsor_params
    params.require(:sponsor_category).permit(:name)
  end



end
