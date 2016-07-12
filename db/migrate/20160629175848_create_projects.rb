class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :summary
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end

  def down
    drop_table :projects
  end
end
