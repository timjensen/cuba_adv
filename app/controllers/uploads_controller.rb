class UploadsController < ApplicationController
  
  @@BUCKET = "cubabakehouse"

  def products
    fileUp = params[:upload]
	  orig_filename =  fileUp['datafile'].original_filename
	  filename = sanitize_filename(orig_filename)
	  AWS::S3::S3Object.store(filename, fileUp['datafile'].read, @@BUCKET)
    flash[:success] = "Image saved! "
	  redirect_to admin_path
  end 

  
  def create
  fileUp = params[:upload]
	  orig_filename =  fileUp['datafile'].original_filename
	  filename = sanitize_filename(orig_filename)
	  AWS::S3::S3Object.store(filename, fileUp['datafile'].read, @@BUCKET, :access => :public_read)
	  url = AWS::S3::S3Object.url_for(filename, @@BUCKET, :authenticated => false)
	  flash[:success] = "Image saved! "
	    redirect_to admin_path
  end
	 
	def destroy
	  AWS::S3::S3Object.find(@image.filename, @@BUCKET).delete
	  @image.destroy
	  render '/home'
	end
	 
	private
	   
  def sanitize_filename(file_name)
	      just_filename = File.basename(file_name)
	      just_filename.sub(/[^\w\.\-]/,'_')
	end
	 
end

