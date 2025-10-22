class CreateGuides < ActiveRecord::Migration[8.0]
  def change
    create_table :guides do |t|
      t.integer :creator_id
      t.string :title
      t.text :description
      t.text :introduction
      t.text :body
      t.boolean :is_draft

      t.timestamps
    end
    # Adding an index for creator_id
    add_index :guides, :creator_id

    # Adding foreign key for creator_id (refers to Users table)
    add_foreign_key :guides, :users, column: :creator_id
  end
end
