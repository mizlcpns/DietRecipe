class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :menu
      t.integer :p
      t.integer :f
      t.integer :c
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
