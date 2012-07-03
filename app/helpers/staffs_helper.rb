module StaffsHelper
  
  def clean_staff
     respond_to do |format|
        format.js { render :action => 'index' }
      end
  end
  
end