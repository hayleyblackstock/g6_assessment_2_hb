class CreateIndustriesCompanies < ActiveRecord::Migration
  def change
    create_table :industries_companies do |t|
      t.integer :industry_id
      t.integer :company_id
    end
  end
end
