class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    # @item = Item.new
    @item = current_user.items.build
  end

  def create
    # @item = Item.new(params_item)
    @item = current_user.items.build(params_item)

    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def params_item
      params.require(:item).permit(:title, :description)
    end

    def find_item
      @item = Item.find(params[:id])
    end
end
