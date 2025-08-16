class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :name, limit: 255
      t.text :description
      t.datetime :deleted_at
      t.boolean :is_completed, default: false

      t.timestamps
    end

    add_index :tasks, :deleted_at
    add_index :tasks, :is_completed
  end
end 