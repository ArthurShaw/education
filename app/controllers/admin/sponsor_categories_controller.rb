class Admin::SponsorCategoriesController < ApplicationController

  def new
    @sponsor_category = SponsorCategory.new
  end

  def create
    @sponsor_category = SponsorCategory.new(sponsor_category_params)
    if @sponsor_category.save
      redirect_to admin_sponsors_path
    else
      render 'new', :status => :bad_request
    end
  end

  def destroy
    @sponsor_category = SponsorCategory.find(params[:id])
    @sponsor_category.destroy
    redirect_to root_path
  end

  private

  def sponsor_category_params
    params.require(:sponsor_category).permit(:name)
  end

end
