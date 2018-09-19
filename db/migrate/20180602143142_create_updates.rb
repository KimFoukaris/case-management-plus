class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :user_id
      t.integer :beneficiary_id
      t.text :notes
      t.timestamps
    end
  end
end
