class AddCompleteToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :complete, :boolean, default: false
  end
end
