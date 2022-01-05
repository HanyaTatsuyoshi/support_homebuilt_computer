class CustomsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,       only: [:show, :edit, :update, :destroy]
  before_action :set_price,          only: [:create, :update]
  before_action :total_amount,       only: [:show, :edit]
  
  def new
    if params[:custom].present?
      @custom = Custom.new(custom_params)
    else
      @custom = Custom.new
    end
  end
  
  def create
    if user_signed_in?
      @custom = Custom.new(custom_params)
      @custom.user_id = current_user.id
      if @custom.save
        flash[:notice] = "構成を保存しました。"
        redirect_to @custom
      else
        render 'new'
      end
    else
      session[:after_login_to_custom] = {
        controller_name: controller_name,
        action_name: action_name,
        params: {
          name: params[:custom][:name],
          cpu: params[:custom][:cpu],
          cpu_url: params[:custom][:cpu_url],
          cpu_price: params[:custom][:cpu_price],
          gpu: params[:custom][:gpu],
          gpu_url: params[:custom][:gpu_url],
          gpu_price: params[:custom][:gpu_price],
          os: params[:custom][:os],
          os_url: params[:custom][:os_url],
          os_price: params[:custom][:os_price],
          memory: params[:custom][:memory],
          memory_url: params[:custom][:memory_url],
          memory_price: params[:custom][:memory_price],
          case: params[:custom][:case],
          case_url: params[:custom][:case_url],
          case_price: params[:custom][:case_price],
          m2: params[:custom][:m2],
          m2_url: params[:custom][:m2_url],
          m2_price: params[:custom][:m2_price],
          ssd: params[:custom][:ssd],
          ssd_url: params[:custom][:ssd_url],
          ssd_price: params[:custom][:ssd_price],
          hdd: params[:custom][:hdd],
          hdd_url: params[:custom][:hdd_url],
          hdd_price: params[:custom][:hdd_price],
          psu: params[:custom][:psu],
          psu_url: params[:custom][:psu_url],
          psu_price: params[:custom][:psu_price],
          motherboard: params[:custom][:motherboard],
          motherboard_url: params[:custom][:motherboard_url],
          motherboard_price: params[:custom][:motherboard_price],
          cooler: params[:custom][:cooler],
          cooler_url: params[:custom][:cooler_url],
          cooler_price: params[:custom][:cooler_price],
          peripheral: params[:custom][:peripheral],
          peripheral_url: params[:custom][:peripheral_url],
          peripheral_price: params[:custom][:peripheral_price],
        }
      }
      redirect_to new_user_session_path
    end
  end
  
  def show
  end

  def edit
  end
  
  def update
    if @custom.update(custom_params)
      flash[:notice] = "構成を変更しました。"
      redirect_to @custom
    else
      render 'edit'
    end
  end
  
  def destroy
    @custom.destroy
    flash[:notice] = "構成を削除しました。"
    redirect_to current_user
  end
  
  
  private
  
    def custom_params
      params.require(:custom).permit(:name, :cpu, :cpu_url, :cpu_price, :gpu, :gpu_url, :gpu_price, :os, :os_url,
                                     :os_price, :memory, :memory_url, :memory_price, :case, :case_url, :case_price,
                                     :m2, :m2_url, :m2_price, :ssd, :ssd_url, :ssd_price, :hdd, :hdd_url,
                                     :hdd_price, :psu, :psu_url, :psu_price, :motherboard, :motherboard_url,
                                     :motherboard_price, :cooler, :cooler_url, :cooler_price, :peripheral,
                                     :peripheral_url, :peripheral_price)
    end
    
    def correct_user
      @custom = current_user.customs.find_by(id: params[:id])
      redirect_to root_url if @custom.nil?
    end
    
    def set_price
      params[:custom][:cpu_price] = 0 if params[:custom][:cpu_price].blank?
      params[:custom][:gpu_price] = 0 if params[:custom][:gpu_price].blank?
      params[:custom][:os_price] = 0 if params[:custom][:os_price].blank?
      params[:custom][:memory_price] = 0 if params[:custom][:memory_price].blank?
      params[:custom][:case_price] = 0 if params[:custom][:case_price].blank?
      params[:custom][:m2_price] = 0 if params[:custom][:m2_price].blank?
      params[:custom][:ssd_price] = 0 if params[:custom][:ssd_price].blank?
      params[:custom][:hdd_price] = 0 if params[:custom][:hdd_price].blank?
      params[:custom][:psu_price] = 0 if params[:custom][:psu_price].blank?
      params[:custom][:motherboard_price] = 0 if params[:custom][:motherboard_price].blank?
      params[:custom][:cooler_price] = 0 if params[:custom][:cooler_price].blank?
      params[:custom][:peripheral_price] = 0 if params[:custom][:peripheral_price].blank?
    end
  
    def total_amount
      @amount = @custom.cpu_price + @custom.gpu_price + @custom.os_price + @custom.memory_price +
                @custom.case_price + @custom.m2_price + @custom.ssd_price + @custom.hdd_price +
                @custom.psu_price + @custom.motherboard_price + @custom.cooler_price + @custom.peripheral_price
    end
end
