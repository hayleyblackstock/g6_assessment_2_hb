class IndustriesController < ApplicationController

def index
  @industries = Industry.all
end

def new
  @industry = Industry.new
  @companies = Company.all
  @company = Company.new

end

def create
  params[:industry][:company_ids] ||= []
  @industry = Industry.new(industry_params)
  if @industry.save
    redirect_to industry_path(@industry), notice: "Industry was created successfully!"
  else
    render :new
  end
end

def update
  params[:industry][:company_ids] ||= []
  @industry = Industry.find(params[:id])
  if @industry.update(industry_params)
    redirect_to industries_path, notice: "Industry was updated successfully!"
  end
end

def destroy
  @industry = Industry.find(params[:id])
  @industry.destroy
  redirect_to industries_path, notice: "Industry was deleted!"
end

def edit
  @industry = Industry.find(params[:id])
end

def show
@industry = Industry.find(params[:id])
end


private
def industry_params
  params.require(:industry).permit(:name, :description, :created_at, :updated_at, :company_ids => [])
end

def company_params
  params.require(:company).permit(:name, :description, :price, :created_at, :updated_at, :industry_ids =>[])
end

end
