class MaintenanceLogsController < ApplicationController
  # before_action :set_maintenance_log, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    if params[:maintenance_category_id]
      @maintenance_category = MaintenanceCategory.find_by(id: params[:maintenance_category_id])
      if @maintenance_category.nil?
        redirect_to maintenance_category_path, alert: "That category doesn't exist"
      else
        @maintenance_logs = @maintenance_category.maintenance_logs
      end
    else 
      @maintenance_logs = MaintenanceLog.all
    end
  end

  def new
    if params[:maintenance_category_id] && !MaintenanceCategory.exists?(params[:maintenance_category_id])
      redirect_to root_path, alert: "that category doesn't exist"
    else 
      @maintenance_category = MaintenanceCategory.find(params[:maintenance_category_id])
      @maintenance_log = @maintenance_category.maintenance_logs.build
    end
  end

  def create
    if params[:maintenance_category_id] && !MaintenanceCategory.exists?(params[:maintenance_category_id])
      redirect_to maintenance_category_path, alert: "that category doesn't exist"
    else 
      #Need to also associate with maintenance_item_id
      @maintenance_category = MaintenanceCategory.find(params[:maintenance_category_id])
      # binding.pry
      if @maintenance_log = @maintenance_category.maintenance_logs.create(maintenance_log_params)
        # if params[:maintenance_item_id]
        #   @maintenance_log(maintenance_item_id: params[:maintenance_item_id])
        # end
        redirect_to maintenance_log_path(@maintenance_log)
      else
        render :new
      end
    end
  end

  def update
    @maintenance_log = MaintenanceLog.find(params[:id])
    @maintenance_log.update(maintenance_log_params)
    if @maintenance_log.save
      redirect_to maintenance_log_path(@maintenance_log)
    else 
      render :edit
    end
  end

  def destroy
    @maintenance_log.destroy
    redirect_to maintenance_logs_path
  end

  def show
    if params[:maintenance_category_id]
      @maintenance_category = MaintenanceCategory.find_by(id: params[:maintenance_category_id])
      @maintenance_log = @maintenance_category.maintenance_logs.find_by(id: params[:id])
      if @maintenance_log.nil?
        redirect_to maintenance_category_maintenance_log_path(@maintenance_category), alert: "log not found"
      end 
    else
      @maintenance_log = MaintenanceLog.find(params[:id])
    end
  end

  def edit 
    if params[:maintenance_category_id]
      maintenance_category = MaintenanceCategory.find_by(id: params[:maintenance_category_id])
      if maintenance_category.nil?
        redirect_to maintenance_category_path, alert: "category not found"
      else 
        @maintenance_log = maintenance_category.maintenance_logs.find_by(id: params[:id])
        redirect_to maintenance_category_maintenance_logs_path, alert: "log not found" if @maintenance_log.nil?
      end 
    else 
      @maintenance_log = MaintenanceLog.find(params[:id])
    end 
  end

  private

  # def set_maintenance_log
  #   @maintenance_log = MaintenanceLog.find(params[:id])
  # end

  def maintenance_log_params
    params.require(:maintenance_log).permit(:notes, :tools, :cost, :date_performed, :date_due, :maintenance_category_id, :maintenance_item_id)
  end

end