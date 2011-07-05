class StoresController < ApplicationController


  def index
    @stores = Store.order('LOWER(name)').all
    @all_campaigns = Campaign.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stores }
    end
  end



  def show
    @store = Store.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @store }
    end
  end

  def setup
    #@store.designers_stores.build
    #@store.designers.build
    @store.designers_stores.build.build_designer
    @all_designers = Designer.all
    @store.employees.build.contacts.build
  end

  def new
    @store = Store.new
    setup

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store }
    end
  end


  def edit
    @store = Store.find(params[:id])
    setup
  end



  def create
    @store = Store.find_or_initialize_by_name_and_street_number(params[:store])

    respond_to do |format|
      if @store.save
        format.html { redirect_to(:root, :notice => 'Store was successfully created.') }
        format.xml  { render :xml => @store, :status => :created, :location => @store }
      else
        setup
        format.html { render :action => "new" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end



  def update
    @store = Store.find(params[:id])

#    @store.attributes = params[:store]
#    puts "***" + @store.designers_stores.last.designer.inspect
#    puts "---" + @store.designers_stores.inspect
#    raise StandardError
    respond_to do |format|
      if @store.update_attributes(params[:store])
        format.html { redirect_to(:root, :notice => 'Store was successfully updated.') }
        format.xml  { head :ok }
      else
        setup
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end



  def destroy
    @store = Store.find(params[:id])
    @store.destroy

    respond_to do |format|
      format.html { redirect_to(stores_url) }
      format.xml  { head :ok }
    end
  end

end
