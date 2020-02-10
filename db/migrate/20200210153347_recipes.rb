class Recipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.integer :calories
      t.integer :time
    end
  end
end
