class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.string :comments
      t.string :status
      t.string :start_date
      t.string :due_date
      t.string :estimation
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
