class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :starttime, null: false
      t.datetime :endtime, null: false
      t.boolean :alltime
      t.text :memo, null: false
      t.integer :consumption
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
