class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :ct_name
      t.text :ct_message
      t.integer :product_id
      t.timestamps
    end
  end
end
