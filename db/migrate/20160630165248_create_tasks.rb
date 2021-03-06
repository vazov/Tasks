class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.string :status
      t.datetime :start_date
      t.datetime :due_date
      t.string :estimation
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
