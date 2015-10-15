class AddColumnToShops < ActiveRecord::Migration
  def change
      add_column :shops, :user_id , :integer, after: :id
  end
end
