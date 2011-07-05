class EmployeesController < ApplicationController


  def index
    @employees = Employee.all
    @employees = Employee.where(store_id:params[:store_id]) unless params[:store_id].nil?

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml:@employees }
      format.json  { render json:@employees.to_json(only:[], methods:[:key, :value]) }
    end
  end



  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee }
    end
  end


  def setup
    (1-@employee.contacts.size).times{@employee.contacts.build}
  end


  def new
    @employee = Employee.new
    setup

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end


  def edit
    @employee = Employee.find(params[:id])
    setup
  end



  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to(:root, :notice => 'Employee was successfully created.') }
        format.xml  { render :xml => @employee, :status => :created, :location => @employee }
      else
        setup
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end



  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to(:root, :notice => 'Employee was successfully updated.') }
        format.xml  { head :ok }
      else
        setup
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end



  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to(employees_url) }
      format.xml  { head :ok }
    end
  end
end
