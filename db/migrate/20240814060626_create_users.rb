class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, default: '', null: false
      t.string :encrypted_password, default: '', null: false
      t.string :username, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
