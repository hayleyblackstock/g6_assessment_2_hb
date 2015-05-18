class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :industry_id

      t.timestamps null: false
    end
  end
end
