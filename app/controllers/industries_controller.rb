class IndustriesController < ApplicationController

def index
  @industries = Industry.all
end

def new
  @industry = Industry.new
end

def create
  @industry = Industry.new(industry_params)
  if @industry.save
    redirect_to industry_path(@industry), notice: "Industry was created successfully!"
  else
    render :new
  end
end

def update
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
  params.require(:industry).permit(:name, :description)
end

end
