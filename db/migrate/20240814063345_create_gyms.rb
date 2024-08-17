class CreateGyms < ActiveRecord::Migration[7.1]
  def change
    create_table :gyms do |t|
      t.string :name, default: '', null: false
      t.string :address, default: '', null: false
      t.jsonb :operating_hours, null: false, default: {}

      t.timestamps
    end
  end
end
