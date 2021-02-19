class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.text :description
      t.string :fisrt_name
      t.string :last_name

      t.references :events, index: true
      t.timestamps
    end
  end
end
