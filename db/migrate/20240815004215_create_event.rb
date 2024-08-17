class CreateEvent < ActiveRecord::Migration[7.1]
  def change
    create_enum :type, ['public', 'private', 'friends only']
    create_table :events do |t|
      t.string :name, default: '', null: false
      t.string :description
      t.enum :event_type, enum_type: 'type', null: false
      t.datetime :open_time
      t.datetime :close_time

      t.timestamps
    end
  end
end
