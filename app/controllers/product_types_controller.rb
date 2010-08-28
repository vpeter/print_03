class ProductTypesController < ApplicationController
  # GET /product_types
  # GET /product_types.xml
  def index
    session[:hely] << "params[:id]: #{params[:id]} | product_types  -  index  "
    #@product_types = ProductType.all(:conditions => "product_category_id = '#{params[:id]}'")   - behatolható
    #@product_types = ProductType.all(:conditions => { :product_category_id => params[:category] } )    - jó, de csak egyenlőségi vizsgálatot tud
    @product_types = ProductType.all(:conditions => ["product_category_id == ? ", params[:category].to_i ] )
    session[:product_category] = params[:category].to_i

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_types }
    end
  end

  # GET /product_types/1
  # GET /product_types/1.xml
  def show
    session[:hely] << "params[:id]: #{params[:id]} | product_types  -  show  "
    @product_type = ProductType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_type }
    end
  end

  # GET /product_types/new
  # GET /product_types/new.xml
  def new
    session[:hely] << "params[:id]: #{params[:id]} | product_types  -  new  "
    @product_type = ProductType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_type }
    end
  end

  # GET /product_types/1/edit
  def edit
    session[:hely] << "params[:id]: #{params[:id]} | product_types  -  edit  "
    @product_type = ProductType.find(params[:id])
  end

  # POST /product_types
  # POST /product_types.xml
  def create
    session[:hely] << "params[:id]: #{params[:id]} | product_types  -  create  "
    @product_type = ProductType.new(params[:product_type])

    respond_to do |format|
      if @product_type.save
        flash[:notice] = 'ProductType was successfully created.'
        format.html { redirect_to(@product_type) }
        format.xml  { render :xml => @product_type, :status => :created, :location => @product_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_types/1
  # PUT /product_types/1.xml
  def update
    session[:hely] << "params[:id]: #{params[:id]} | product_types  -  update  "
    @product_type = ProductType.find(params[:id])

    respond_to do |format|
      if @product_type.update_attributes(params[:product_type])
        flash[:notice] = 'ProductType was successfully updated.'
        format.html { redirect_to(@product_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.xml
  def destroy
    session[:hely] << "params[:id]: #{params[:id]} | product_types  -  destroy  "
    @product_type = ProductType.find(params[:id])
    @product_type.destroy

    respond_to do |format|
      format.html { redirect_to(product_types_url) }
      format.xml  { head :ok }
    end
  end
end
