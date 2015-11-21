class Admin::SponsorCategoriesController < ApplicationController

  before_action :find_category, only: [:update, :destroy, :edit]
  before_action :check_permission


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

  def edit
  end

  def update
    if @sponsor_category.update(sponsor_category_params)
      redirect_to admin_sponsors_path
    else
      render 'edit'
    end
  end

  def destroy
    @sponsor_category.destroy
    redirect_to admin_sponsors_path
  end

  private

  def sponsor_category_params
    params.require(:sponsor_category).permit(:name, :name_en)
  end

  def find_category
    @sponsor_category = SponsorCategory.find(params[:id])
    render_404 unless @sponsor_category
  end

  def check_permission
    render_403 unless current_user.has_role? :admin
  end

end
