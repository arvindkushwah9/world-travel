class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
