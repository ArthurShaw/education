class Admin::ItemsController < ApplicationController
  before_action { check_permission(:admin) }
  before_action :find_item, only: [:show, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :picture)
  end

  def find_item
    @item = Item.find(params[:id])
    render_404 unless @item
  end
end