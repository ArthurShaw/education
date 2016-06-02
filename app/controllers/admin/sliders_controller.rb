class Admin::SlidersController < ApplicationController
  before_action { check_permission(:admin) }
  before_action :find_slide, only: :destroy

  def index
    @slides = Slider.all
  end

  def new
    @slide = Slider.new
  end

  def show

  end

  def create
    @slide = Slider.new(slide_params)
    if @slide.save
      redirect_to admin_sliders_path
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_sliders_path
  end

  private

  def slide_params
    params.require(:slider).permit(:item_id)
  end

  def find_slide
    @slide = Slider.find(params[:id])
    render_404 unless @slide
  end
end