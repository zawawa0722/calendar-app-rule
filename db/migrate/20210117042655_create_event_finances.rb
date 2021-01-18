class CreateEventFinances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_finances do |t|
      t.references :event, foreign_key: true
      t.references :finance, foreign_key: true
      t.timestamps
    end
  end
end
