class Product < ActiveRecord::Base
  attr_accessible :descrip, :name, :price, :pro_image, :pro_type, :spec, :sprice
  
  validates :name, presence: true, uniqueness: true
end
