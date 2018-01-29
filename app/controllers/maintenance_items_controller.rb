class MaintenanceItemsController < ApplicationController
  before_action :set_maintenance_item, only: [:show, :edit, :update, :destroy]

  def index
    @maintenance_items = MaintenanceItem.all
  end

  def new
    @maintenance_item = MaintenanceItem.new
  end

  def create
    @maintenance_item = MaintenanceItem.new(maintenance_item_params)
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
    @maintenance_categories = MaintenanceCategory.all
  end

  def edit 
  end

  private

  def set_maintenance_item
    @maintenance_item = MaintenanceItem.find(params[:id])
  end

  def maintenance_item_params
    params.require(:maintenance_item).permit(:name, :user_id) ###does user_id need to be here?
  end

end
