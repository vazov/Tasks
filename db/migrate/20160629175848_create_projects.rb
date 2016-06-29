class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :summary
      t.string :start_date
      t.string :end_date

      t.timestamps null: false
    end
  end

  def down
    drop_table :projects
  end
end
