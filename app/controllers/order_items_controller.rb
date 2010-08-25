class OrderItemsController < ApplicationController

  # GET /order_items/1
  # GET /order_items/1.xml
  def index
    session[:hely] << " | order_items  -  index  "
    @order_items = OrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_items }
    end
  end

  def szamol
    session[:hely] << " | order_items  -  szamol  "
#    kiszámolja a lezárt árat
    if  @order_item.darab
      darab = @order_item.darab
    else
      darab = 0
    end
    @order_item.ar_lezart = darab * 30
  end

  def teteladatai
    session[:hely] << " | order_items  -  teteladatai  "
    @product_type = ProductType.find(params[:id])
    session[:product_type_id] = params[:id]
    @order_item = OrderItem.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_item }
    end
  end

  def teteladatai_szerkeszt
    session[:hely] << " | order_items  -  teteladatai_szerkeszt  "
    @order_item = OrderItem.find(params[:id])
    @product_type = ProductType.find(@order_item.product_type_id)
    session[:product_type_id] = params[:id]

    respond_to do |format|
      format.html #render :action => "teteladatai"
      format.xml  { render :xml => @order_item }
    end
  end

  def show
    session[:hely] << " | order_items  -  show  "
#    @order_item.save
    @order_item = OrderItem.find(params[:id])
    session[:order_item_id] = @order_item.id
    szamol # meghívja a lezárt árat kiszámoló metódust
    session[:order] ||= Order.create # ,megnézi hogy létezik-e az ideiglenes
    # order ehhez a látogatóhoz
    @order = session[:order] # az order változóba pakolja a session tartalmát
    session[:order_id] = @order.id
    @order_item.order_id = @order.id # a frissen létrehozott order itemet az
    # ideiglenes orderhez kapcsolja az order_id beírásával
    @order_item.product_type_id = session[:product_type_id]
    @order_item.save # menti az order itemet az order_id vel
#    @kosar = OrderItem.all(:conditions => ["order_id == ? ", @order.id ] )
    show_kosar #ez rakja be a kosár változóba a megjelenítendő order_item eket
  end

  def show_kosar
    session[:hely] << " | order_items  -  show_kosar  "
    @order = session[:order] # az order változóba pakolja a session tartalmát
    @kosar = OrderItem.all(:conditions => ["order_id == ? ", @order.id ] )

#    @kosar = OrderItem.find(session[:order])
#    redirect_to :action => "kosar"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_item }
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.xml
  def destroy
    session[:hely] << " | order_items  -  destroy  "
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    redirect_to :action => "show_kosar"

#    respond_to do |format|
#      format.html { redirect_to show }
#      format.xml  { head :ok }
#    end
  end

  # GET /order_items/new
  # GET /order_items/new.xml
  def new
    session[:hely] << " | order_items  -  new  "
    @order_item = OrderItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_item }
    end
  end

  # GET /order_items/1/edit
  def edit
    session[:hely] << " | order_items  -  edit  "
    @order_item = OrderItem.find(params[:id])
  end

  # POST /order_items
  # POST /order_items.xml
  def create
    session[:hely] << " | order_items  -  create  "
    @order_item = OrderItem.new(params[:order_item])

    respond_to do |format|
      if @order_item.save
        flash[:notice] = 'OrderItem was successfully created.'
        format.html { redirect_to(@order_item) }
        format.xml  { render :xml => @order_item, :status => :created, :location => @order_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_items/1
  # PUT /order_items/1.xml
  def update
    session[:hely] << " | order_items  -  update  "
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      if @order_item.update_attributes(params[:order_item])
        flash[:notice] = 'OrderItem was successfully updated.'
        format.html { redirect_to(@order_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_item.errors, :status => :unprocessable_entity }
      end
    end
  end

end
