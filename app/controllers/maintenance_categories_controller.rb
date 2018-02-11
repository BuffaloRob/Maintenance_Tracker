class MaintenanceCategoriesController < ApplicationController
  # before_action :set_maintenance_category, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    if params[:maintenance_item_id]
      @maintenance_item = MaintenanceItem.find_by(id: params[:maintenance_item_id])
      if @maintenance_item.nil?
        redirect_to maintenance_item_path, alert: "That Maintenance Item Does Not Exist"
      else
        @maintenance_categories = @maintenance_item.maintenance_categories
      end
    else 
      @maintenance_categories = MaintenanceCategory.all
    end
  end

  def new
    if params[:maintenance_item_id] && !MaintenanceItem.exists?(params[:maintenance_item_id])
      redirect_to maintenance_item_path, alert: "Maintenance Item not found"
    else
      @maintenance_item = MaintenanceItem.find(params[:maintenance_item_id])
      @maintenance_category = @maintenance_item.maintenance_categories.build
    end
  end

  def create
    ## You also need to check if belongs to the right user 
    if params[:maintenance_item_id] && !MaintenanceItem.exists?(params[:maintenance_item_id])
      redirect_to maintenance_item_path, alert: "Maintenance Item not found"
    else
      @maintenance_item = MaintenanceItem.find(params[:maintenance_item_id])
      if @maintenance_category = @maintenance_item.maintenance_categories.create(maintenance_category_params)
        redirect_to maintenance_item_maintenance_category_path(@maintenance_item, @maintenance_category)
      else 
        render :new
      end
    end 

  end

  def update
    @maintenance_category = MaintenanceCategory.find(params[:id])
    @maintenance_category.update

    if @maintenance_category.save
      redirect_to maintenance_category_path(@maintenance_category)
    else
      render :edit
    end
  end

  def destroy
    @maintenance_category.destroy
    redirect_to maintenance_categories_path
  end

  def show
    
    if params[:maintenance_item_id]
      @maintenance_item = MaintenanceItem.find_by(id: params[:maintenance_item_id])
      @maintenance_category = @maintenance_item.maintenance_categories.find_by(id: params[:id])
      if @maintenance_category.nil?
        redirect_to maintenance_item_maintenance_category_path(@maintenance_item), alert: "Category not found"
      end
    else 
      @maintenance_category = MaintenanceCategory.find(params[:id])
    end
  end

  def edit 
    if params[:maintenance_item_id]
      maintenance_item = MaintenanceItem.find_by(id: params[:maintenance_item_id])
      if maintenance_item.nil?
        redirect_to maintenance_item_path, alert: "Item not found"
      else 
        @maintenance_category = maintenance_item.maintenance_categories.find_by(id: params[:id])
        redirect_to maintenance_item_maintenance_categories_path, alert: "Category not found" if @maintenance_category.nil?
      end
    else
      @maintenance_category = MaintenanceCategory.find(params[:id])
    end
  end

  private

  # def set_maintenance_category
  #   @maintenance_category = MaintenanceCategory.find(params[:id])
  # end

  def maintenance_category_params
    params.require(:maintenance_category).permit(:name, :maintenance_item_id) 
  end
end
