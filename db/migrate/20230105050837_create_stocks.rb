class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :company_name
      t.string :symbol
      t.integer :quantity
      t.string :logo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
