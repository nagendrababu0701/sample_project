class Product < ActiveRecord::Base
 has_many :categories
 #attr_accessible :categories_attributes
 accepts_nested_attributes_for :categories
end
