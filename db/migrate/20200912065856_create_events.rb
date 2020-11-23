class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :alltime
      t.text :memo
      t.integer :consumption
      t.timestamps
    end
  end
end
