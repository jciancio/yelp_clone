class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :email_confirmation
      t.string :password_digest
      t.string :password_confirmation

      t.timestamps null: false
    end
  end
end
