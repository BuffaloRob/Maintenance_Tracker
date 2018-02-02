class MaintenanceItemsController < ApplicationController
  before_action :set_maintenance_item, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @maintenance_items = current_user.maintenance_items
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @maintenance_item = MaintenanceItem.new
  end

  def create
    @maintenance_item = current_user.maintenance_items.build(maintenance_item_params)
    if @maintenance_item.save
      redirect_to maintenance_item_path(@maintenance_item)
    else
      @maintenance_items = MaintenanceItem.all
      redirect_to :index
    end
  end

  def update
    @maintenance_item.update(maintenance_item_params)
    redirect_to maintenance_item_path(@maintenance_item)
  end

  def destroy
    @maintenance_item.destroy
    redirect_to maintenance_items_path
  end

  def show
    #test
    # @maintenance_categories = MaintenanceCategory.all  
    # @maintenance_item = current_user.maintenance_item.find_by(id: params[:id])
  end

  def edit 
  end

  private

  def set_maintenance_item
    @maintenance_item = MaintenanceItem.find(params[:id])
  end

  def maintenance_item_params
    params.require(:maintenance_item).permit(:name, :user_id)
  end

end
