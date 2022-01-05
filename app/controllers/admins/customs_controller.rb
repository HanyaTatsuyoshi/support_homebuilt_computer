class Admins::CustomsController < Admins::ApplicationController
  
  def index
    @customs = Custom.paginate(page: params[:page])
  end

  def show
    @custom = Custom.find(params[:id])
    @amount = @custom.cpu_price + @custom.gpu_price + @custom.os_price + @custom.memory_price +
              @custom.case_price + @custom.m2_price + @custom.ssd_price + @custom.hdd_price +
              @custom.psu_price + @custom.motherboard_price + @custom.cooler_price + @custom.peripheral_price
  end

  def destroy
    Custom.find(params[:id]).destroy
    flash[:success] = "Custom deleted"
    redirect_to admins_customs_url
  end
end
