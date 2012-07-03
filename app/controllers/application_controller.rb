class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include ProductsHelper
  include SessionsHelper
  include StaffsHelper
end
