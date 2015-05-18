class AddIndustryIdToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :industry_ids, :integer
  end
end
