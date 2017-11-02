class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
