class CompaniesController < ApplicationController

def index
  @companies = Company.all
end

def new
  @company = Company.new
end

def create
  @company = Company.new(company_params)
  if @company.save
    redirect_to company_path(@company), notice: "Company was created successfully!"
  else
    render :new
  end
end

def update
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
end


private
def company_params
  params.require(:company).permit(:name, :description, :price, :created_at, :updated_at)
end

end
