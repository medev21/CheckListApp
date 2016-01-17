class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy, :complete]

  def index
    # @items = Item.all.order('created_at DESC')

    # displays user items if user is logged in
    if user_signed_in?
      @items = Item.where(:user_id => current_user.id).order('created_at DESC')
    end
  end

  def show
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

  def edit
  end

  def update
    if @item.update(params_item)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def complete
    # this method update the completed_at attr with time now
    # after user checks the box and redirects to the index page
    @item.update_attribute(:completed_at, Time.now)
    redirect_to root_path
  end

  private
    def params_item
      params.require(:item).permit(:title, :description)
    end

    def find_item
      @item = Item.find(params[:id])
    end
end
