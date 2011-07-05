class TouchesController < ApplicationController


  def index
    @touches = Touch.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @touches }
    end
  end



  def show
    @touch = Touch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @touch }
    end
  end


  def setup
    @all_campaigns = Campaign.all
    @all_stores = Store.all
    @touch.at ||= DateTime.now
    e = @touch.build_employee unless @touch.employee
    (1 - e.contacts.size).times{e.contacts.build}
    @store_employees = @touch.store.employees.all unless @touch.store.nil?
  end

  def new
    @touch = Touch.new(params[:touch])
    setup

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @touch }
    end
  end


  def edit
    @touch = Touch.find(params[:id])
    setup
  end



  def create
    @touch = Touch.new(params[:touch])
    @touch.employee.store ||= @touch.store unless @touch.employee.nil?

    respond_to do |format|
      if @touch.save
        format.html { redirect_to(:root, :notice => 'Touch was successfully created.') }
        format.xml  { render :xml => @touch, :status => :created, :location => @touch }
      else
        setup
        format.html { render :action => "new" }
        format.xml  { render :xml => @touch.errors, :status => :unprocessable_entity }
      end
    end
  end



  def update
    @touch = Touch.find(params[:id])

    respond_to do |format|
      if @touch.update_attributes(params[:touch])
        format.html { redirect_to(:root, :notice => 'Touch was successfully updated.') }
        format.xml  { head :ok }
      else
        setup
        format.html { render :action => "edit" }
        format.xml  { render :xml => @touch.errors, :status => :unprocessable_entity }
      end
    end
  end



  def destroy
    @touch = Touch.find(params[:id])
    @touch.destroy

    respond_to do |format|
      format.html { redirect_to(touches_url) }
      format.xml  { head :ok }
    end
  end
end
