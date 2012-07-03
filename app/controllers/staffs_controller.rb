class StaffsController < ApplicationController
  
  def new
    @staff = Staff.new
    clean_simple
  end
  
  def create
    @staff = Staff.new(params[:staff])
    if @staff.save
      @staffs = Staff.all
      flash[:success] = "Staff Profile Created Successfully"
      clean_staff
    else
      @staffs = Staff.all
      flash[:fail] = "An Error Has Occured During Staff Profile Creation"
      clean_staff
    end
  end
  
  def showstaff
    @staffs = Staff.all
    if request.xhr?
      clean_simple
    else
      render 'showstaff'
    end
  end
  
  def index
    @staffs = Staff.all
    clean_simple
  end
  
  def edit
    @staff = Staff.find(params[:id])
    @files = Dir.glob("app/assets/images/staffs/*").map{|a| File.basename(a)}
    clean_simple
  end
  
  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(params[:staff])
      @staffs = Staff.all
      flash[:success] = "Profile updated"
      clean_staff
    else
      @staffs = Staff.all
      flash[:fail] = "An Error has occured the profile was not updated"
      clean_staff
    end
  end
  
  def destroy
    Staff.find(params[:id]).destroy
    @staffs = Staff.all
    flash[:success] = "Staff profile was destroyed."
    clean_staff
  end
  
end