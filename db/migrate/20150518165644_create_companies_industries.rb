class CreateCompaniesIndustries < ActiveRecord::Migration
  def change
    create_table :companies_industries do |t|
      t.integer :industry_id
      t.integer :company_id
    end
  end
end
