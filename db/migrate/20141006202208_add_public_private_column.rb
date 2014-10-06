class AddPublicPrivateColumn < ActiveRecord::Migration
  def change
    add_column :goals, :privacy, :string
    change_column :goals, :privacy, :string, null: false
  end
end
