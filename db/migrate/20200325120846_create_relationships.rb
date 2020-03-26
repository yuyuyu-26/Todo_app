class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :follow_id

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :follow_id
    add_index :relationships, [:user_id, :follow_id], unique: true
  end
end
