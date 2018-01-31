class MaintenanceLogsController < ApplicationController
  before_action :set_maintenance_log, only: [:show, :edit, :update, :destroy]

  def index
    @maintenance_logs = MaintenanceLog.all
  end

  def new
    @maintenance_log = MaintenanceLog.new
  end

  def create
    @maintenance_log = MaintenanceLog.new(maintenance_log_params)
    if @maintenance_log.save
      redirect_to maintenance_log_path(@maintenance_log)
    else
      @maintenance_logs = MaintenanceLog.all
      redirect_to :index
    end
  end

  def update
    @maintenance_log.update(maintenance_log_params)
    redirect_to maintenance_log_path(@maintenance_log)
  end

  def destroy
    @maintenance_log.destroy
    redirect_to maintenance_logs_path
  end

  def show
  end

  def edit 
  end

  private

  def set_maintenance_log
    @maintenance_log = MaintenanceLog.find(params[:id])
  end

  def maintenance_log_params
    params.require(:maintenance_log).permit(:notes, :tools, :cost, :date_performed, :date_due)
  end
end
