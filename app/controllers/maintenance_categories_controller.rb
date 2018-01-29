class MaintenanceCategoriesController < ApplicationController
  before_action :set_maintenance_category, only: [:show, :edit, :update, :destroy]

  def index
    @maintenance_categories = MaintenanceCategory.all
  end

  def new
    @maintenance_category = MaintenanceCategory.new
  end

  def create
    @maintenance_category = MaintenanceCategory.new(maintenance_category_params)
    if @maintenance_category.save
      redirect_to maintenance_category_path(@maintenance_category)
    else
      @maintenance_categories = MaintenanceCategory.all
      redirect_to :index
    end
  end

  def update
    @maintenance_category.update(maintenance_category_params)
    redirect_to maintenance_category_path(@maintenance_category)
  end

  def destroy
    @maintenance_category.destroy
    redirect_to maintenance_categories_path
  end

  def show
  end

  def edit 
  end

  private

  def set_maintenance_category
    @maintenance_category = MaintenanceCategory.find(params[:id])
  end

  def maintenance_category_params
    params.require(:maintenance_category).permit(:name) 
  end
end
