class CompaniesController < ApplicationController

def index
  @companies = Company.all
end

def new
  @company = Company.new
  @industries = Industry.all
  @industry = Industry.new
end

def create
  params[:company][:industry_ids] ||= []
  @company = Company.new(company_params)
  if @company.save
    redirect_to company_path(@company), notice: "Company was created successfully!"
  else
    render :new
  end
end

def update
  params[:company][:industry_ids] ||= []
  @company = Company.find(params[:id])
  if @company.update(company_params)
    redirect_to companies_path, notice: "Company was updated successfully!"
  end
end

def destroy
  @company = Company.find(params[:id])

  @company.destroy
  redirect_to companies_path, notice: "Company was deleted!"
end

def edit
  @company = Company.find(params[:id])
end

def show
@company = Company.find(params[:id])
@companies = Company.all
end


private
def company_params
  params.require(:company).permit(:name, :description, :price, :created_at, :updated_at, :industry_ids =>[])
end

def industry_params
  params.require(:industry).permit(:name, :description, :created_at, :updated_at, :company_ids => [])
end


end
