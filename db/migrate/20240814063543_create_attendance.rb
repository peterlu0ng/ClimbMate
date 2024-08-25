class CreateAttendance < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances, id: :uuid do |t|
      t.references :event, null: false, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, type: :uuid, foreign_key: { on_delete: :cascade }
      t.integer :attendance_status, null: false
    end
  end
end
