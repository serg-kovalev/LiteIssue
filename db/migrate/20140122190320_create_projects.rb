class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.string :status, :null => false, :default => false
      t.text :description
      t.timestamps
    end
  end
end
