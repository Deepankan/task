class AddColumToShop < ActiveRecord::Migration
  def change
    add_column :shops, :shop_name,:string
    add_column :shops, :shop_address,:string
    add_column :shops, :shop_description,:string
    add_column :shops, :avatar, :string

  end
end
