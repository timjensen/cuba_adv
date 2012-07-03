class Staff < ActiveRecord::Base
  attr_accessible :bio, :image, :name, :title
  
  validates :name, presence: true, uniqueness: true
end
