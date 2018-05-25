class MaintenanceLogsController < ApplicationController

  def past_due
    @current_user_maintenance_logs = []
    @maintenance_items = current_user.maintenance_items
    @maintenance_items.each do |item|
      item.maintenance_logs.past_due.each do |log|
        @current_user_maintenance_logs << log
      end
    end
  end

  def upcoming
    @current_user_maintenance_logs = []
    @maintenance_items = current_user.maintenance_items
    @maintenance_items.each do |item|
      item.maintenance_logs.upcoming.each do |log|
        @current_user_maintenance_logs << log
      end
    end
  end

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
    if params[:maintenance_item_id] && !MaintenanceItem.exists?(params[:maintenance_item_id])
      redirect_to root_path, alert: "that item doesn't exist"
    else 
      @maintenance_item = MaintenanceItem.find(params[:maintenance_item_id])
      @maintenance_log = @maintenance_item.maintenance_logs.build
    end
  end

  def create
    if params[:maintenance_item_id] && !MaintenanceItem.exists?(params[:maintenance_item_id])
      redirect_to maintenance_item_path, alert: "that item doesn't exist"
    else 
      @maintenance_item = MaintenanceItem.find(params[:maintenance_item_id]) 
      #@maintenance_item = MaintenanceItem.find(params[:maintenance_log][:maintenance_category_attributes][:id])
      @maintenance_log = @maintenance_item.maintenance_logs.create(maintenance_log_params)
      if @maintenance_log.valid?
        respond_to do |format|
          format.html {redirect_to maintenance_item_maintenance_log_path(@maintenance_item, @maintenance_log)}
          format.json { render json: @maintenance_log}
        end
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
    MaintenanceLog.find(params[:id]).destroy
    redirect_to :root
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

    respond_to do |format|
      format.html { render :show}
      format.json { render json: @maintenance_log}
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

  def maintenance_log_params
    params.require(:maintenance_log).permit(:notes, :tools, :cost, :date_performed, :date_due, :maintenance_item_id, :maintenance_category_id, maintenance_category_attributes: [:name, :id] )
  end

end