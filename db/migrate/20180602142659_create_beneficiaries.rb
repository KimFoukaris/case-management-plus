class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :gender
      t.integer :id_number
      t.timestamps
    end
  end
end
