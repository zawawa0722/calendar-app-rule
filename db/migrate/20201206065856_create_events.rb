class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.boolean :alltime
      t.text :body, null: false
      t.bigint :user_id, foreign_key: true
      t.bigint :finance_id, foreign_key: true
      t.timestamps
    end
  end
end
