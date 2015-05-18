class AddCompanyIdToIndustry < ActiveRecord::Migration
  def change
    add_column :industries, :company_ids, :integer
  end
end
