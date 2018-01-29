class MaintenanceItemsController < ApplicationController
  before_action :set_maintenance_item, only: [:show, :edit, :update, :destroy]

  def index
    @maintenance_items = MaintenanceItem.all
  end

  def new
    @maintenance_item = MaintenanceItem.new
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end

  def show
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
