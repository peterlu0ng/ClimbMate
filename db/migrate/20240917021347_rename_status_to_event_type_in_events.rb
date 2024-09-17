class RenameStatusToEventTypeInEvents < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :status, :event_type
  end
end
