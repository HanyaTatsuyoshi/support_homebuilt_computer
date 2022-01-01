class CreateCustoms < ActiveRecord::Migration[6.0]
  def change
    create_table :customs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :case
      t.text :case_url
      t.integer :case_price
      t.string :cpu
      t.text :cpu_url
      t.integer :cpu_price
      t.string :gpu
      t.text :gpu_url
      t.integer :gpu_price
      t.string :motherboard
      t.text :motherboard_url
      t.integer :motherboard_price
      t.string :memory
      t.text :memory_url
      t.integer :memory_price
      t.string :cooler
      t.text :cooler_url
      t.integer :cooler_price
      t.string :m2
      t.text :m2_url
      t.integer :m2_price
      t.string :ssd
      t.text :ssd_url
      t.integer :ssd_price
      t.string :hdd
      t.text :hdd_url
      t.integer :hdd_price
      t.string :psu
      t.text :psu_url
      t.integer :psu_price
      t.string :peripheral
      t.text :peripheral_url
      t.integer :peripheral_price

      t.timestamps
    end
    add_index :customs, [:user_id, :created_at]
  end
end
