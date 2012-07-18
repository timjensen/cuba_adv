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
  
  def spec_it
    @spec = Product.where("spec != ''").first
  end
  
end