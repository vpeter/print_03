class ProductCategoriesController < ApplicationController
 
  def index
    session[:hely]= []
    session[:hely] << "params[:id]: #{params[:id]} |#{params[:id]} | product_categories  -  index  "
    @product_categories = ProductCategory.all    
  end

  def show
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  show  "
    @product_category = ProductCategory.find(params[:id])
  end

  def new
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  new  "
    @product_category = ProductCategory.new    
  end
  
  def edit
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  edit  "
    @product_category = ProductCategory.find(params[:id])
  end
  
  def create
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  create  "
    @product_category = ProductCategory.new(params[:product_category])

    if @product_category.save
      flash[:notice] = 'ProductCategory was successfully created.'
        redirect_to(@product_category)
      else
        render :action => "new"
      end
  end
 
  def update
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  update  "
    @product_category = ProductCategory.find(params[:id])
    
    if @product_category.update_attributes(params[:product_category])
      flash[:notice] = 'ProductCategory was successfully updated.'
      redirect_to(@product_category)
    else
      render :action => "edit"      
    end

  end
  
  def destroy
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  destroy  "
    @product_category = ProductCategory.find(params[:id])
    @product_category.destroy    
    redirect_to(product_categories_url)
  end
end
