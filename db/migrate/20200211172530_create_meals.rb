class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :amount
      t.float :weight
    end
  end
end
