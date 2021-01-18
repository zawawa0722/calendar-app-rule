class CreateFinances < ActiveRecord::Migration[6.0]
  def change
    create_table :finances do |t|
      t.integer :consumption
      t.text :item
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
