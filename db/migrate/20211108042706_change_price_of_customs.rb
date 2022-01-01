class ChangePriceOfCustoms < ActiveRecord::Migration[6.0]
  def up
    change_column :customs, :cpu_price, :integer, default: 0
    change_column :customs, :gpu_price, :integer, default: 0
    change_column :customs, :os_price, :integer, default: 0
    change_column :customs, :memory_price, :integer, default: 0
    change_column :customs, :case_price, :integer, default: 0
    change_column :customs, :m2_price, :integer, default: 0
    change_column :customs, :ssd_price, :integer, default: 0
    change_column :customs, :hdd_price, :integer, default: 0
    change_column :customs, :psu_price, :integer, default: 0
    change_column :customs, :motherboard_price, :integer, default: 0
    change_column :customs, :cooler_price, :integer, default: 0
    change_column :customs, :peripheral_price, :integer, default: 0
  end
  
  def down
    change_column :customs, :cpu_price, :integer
    change_column :customs, :gpu_price, :integer
    change_column :customs, :os_price, :integer
    change_column :customs, :memory_price, :integer
    change_column :customs, :case_price, :integer
    change_column :customs, :m2_price, :integer
    change_column :customs, :ssd_price, :integer
    change_column :customs, :hdd_price, :integer
    change_column :customs, :psu_price, :integer
    change_column :customs, :motherboard_price, :integer
    change_column :customs, :cooler_price, :integer
    change_column :customs, :peripheral_price, :integer
  end
end
