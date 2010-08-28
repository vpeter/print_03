class ProductCategoriesController < ApplicationController


  # GET /product_categories
  # GET /product_categories.xml
  def index
    session[:hely]= []
    session[:hely] << "params[:id]: #{params[:id]} |#{params[:id]} | product_categories  -  index  "
    @product_categories = ProductCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_categories }
    end
  end

  # GET /product_categories/1
  # GET /product_categories/1.xml
  def show
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  show  "
    @product_category = ProductCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_category }
    end
  end

  # GET /product_categories/new
  # GET /product_categories/new.xml
  def new
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  new  "
    @product_category = ProductCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_category }
    end
  end

  # GET /product_categories/1/edit
  def edit
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  edit  "
    @product_category = ProductCategory.find(params[:id])
  end

  # POST /product_categories
  # POST /product_categories.xml
  def create
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  create  "
    @product_category = ProductCategory.new(params[:product_category])

    respond_to do |format|
      if @product_category.save
        flash[:notice] = 'ProductCategory was successfully created.'
        format.html { redirect_to(@product_category) }
        format.xml  { render :xml => @product_category, :status => :created, :location => @product_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_categories/1
  # PUT /product_categories/1.xml
  def update
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  update  "
    @product_category = ProductCategory.find(params[:id])

    respond_to do |format|
      if @product_category.update_attributes(params[:product_category])
        flash[:notice] = 'ProductCategory was successfully updated.'
        format.html { redirect_to(@product_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_categories/1
  # DELETE /product_categories/1.xml
  def destroy
    session[:hely] << "params[:id]: #{params[:id]} | product_categories  -  destroy  "
    @product_category = ProductCategory.find(params[:id])
    @product_category.destroy

    respond_to do |format|
      format.html { redirect_to(product_categories_url) }
      format.xml  { head :ok }
    end
  end
end
