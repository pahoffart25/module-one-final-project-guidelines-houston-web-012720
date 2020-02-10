class CreateKitchens < ActiveRecord::Migration[5.2]
  def change
    create_table :kitchens do |t|
      t.integer :recipe_id
      t.integer :user_id
    end
  end
end
