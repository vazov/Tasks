class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.references :team, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end