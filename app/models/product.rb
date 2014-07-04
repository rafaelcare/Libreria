class Product < ActiveRecord::Base
	has_many :saleDetails
	has_many :orderDetails
	has_one :category
	has_many :users
	#has_many :orders, :through => :users
end
