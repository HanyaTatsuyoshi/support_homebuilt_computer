class AddOsToCustoms < ActiveRecord::Migration[6.0]
  def change
    add_column :customs, :os, :string
    add_column :customs, :os_url, :text
    add_column :customs, :os_price, :integer
  end
end
