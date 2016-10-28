class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :dob
      t.string :email
      t.text :address
      t.text :billing_details
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
