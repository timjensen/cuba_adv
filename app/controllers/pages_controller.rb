class PagesController < ApplicationController
  
  def home
    @page = Page.find(params[:id])
  end
  
  def adminhome
    @page = Page.find(params[:id])
    render :layout => 'admin'
  end
  
  def edit
    @page = Page.find(params[:id])
     
    respond_to do |format|
        format.js {}
      end
  end
    
  def show
    @page = Page.find(params[:id])
    if request.xhr?
      clean_simple
    else
      render 'showprod'
    end
  end
      
end