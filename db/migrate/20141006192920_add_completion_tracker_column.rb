class AddCompletionTrackerColumn < ActiveRecord::Migration
  def change
    add_column :goals, :status, :string, default: "PENDING"
  end
end
