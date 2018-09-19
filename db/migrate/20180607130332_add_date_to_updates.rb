class AddDateToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :date, :date
  end
end
