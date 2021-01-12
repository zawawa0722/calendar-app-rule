class CreateFinances < ActiveRecord::Migration[6.0]
  def change
    create_table :finances do |t|
      t.integer :consumption
      t.string :item
      t.timestamps
    end
  end
end
