module ProductsHelper
  
  def clean_simple
    respond_to do |format|
        format.js {}
    end
  end
    
  def clean_product
     respond_to do |format|
        format.js { render :action => 'index' }
      end
  end
  
end