class ProductsController < ApplicationController
  
    
  def set_groups
    @spec = Product.where("spec != ''").first
    @pies = Product.where("pro_type = 'Pie'")
    @sweets = Product.where("pro_type = 'Sweet'")
    @breads = Product.where("pro_type = 'Bread'")
    @sands = Product.where("pro_type = 'Sandwich'")
    @miscs = Product.where("pro_type = 'Misc'")
  end
  
  def showprod
    @products = Product.find(:all, :limit => 6, :order => "Random()")
    if request.xhr?
    clean_simple
    else
     render 'showprod'
    end
  end
  
  def index
    set_groups
    clean_simple
  end
  
  def edit
    @product = Product.find(params[:id])
    @files = Dir.glob("app/assets/images/products/*").map{|a| File.basename(a)}
    clean_simple
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      set_groups
      flash[:success] = "Product Updated Successfully"
      clean_product
    else
      set_groups
      clean_product
    end
  end
  
  def new
    @product = Product.new
    clean_simple
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      set_groups
      flash[:success] = "Product Created Successfully"
      clean_product
    else
      set_groups
      clean_product
    end
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product destroyed."
    set_groups
    clean_product
  end
  
  def specup
    @product = Product.find(params[:id])
    @nulls = Product.all
    @nulls.each{ |e| e.update_attributes(:spec => "")}
    @product.update_attributes( :spec => DateTime.now.next_week )
    flash[:success] = "Product placed on promotion"
    set_groups
    clean_product
  end
  
  def specdown
    @product = Product.find(params[:id])
    @product.update_attributes( :spec => "" )
    flash[:success] = "Product removed from promotion"
    set_groups
    clean_product
  end
  
  
end