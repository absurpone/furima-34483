class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :title, :detail, :category_id, :condition_id, :pays_postage_id, :prefecture_id,
                                 :shipping_date_id).merge(user_id: current_user.id)
  end
end

private

def set_item
  @item = Item.find(params[:id])
end

def contributor_confirmation
  unless current_user == @item.user
    redirect_to root_path
  end
end