class CreateAttendance < ActiveRecord::Migration[7.1]
  def change
    create_enum :status, ['Going', 'Maybe', "Can't Go"]

    create_table :attendances do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.enum :attendance_status, enum_type: 'status', null: false

      t.timestamps
    end
  end
end
