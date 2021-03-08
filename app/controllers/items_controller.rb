class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :check_item_sold, only: [:edit, :update]

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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
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

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword]).order('created_at DESC')
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :title, :detail, :category_id, :condition_id, :pays_postage_id, :prefecture_id,
                                 :shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def check_item_sold
    redirect_to root_path if @item.purchase.present?
  end
end
