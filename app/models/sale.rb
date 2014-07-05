class Sale < ActiveRecord::Base
	belongs_to :client, :autosave => true
	belongs_to :user, :foreign_key => :usuario_id
	has_many :saleDetails, :autosave => true #La clase relacionada se llama: SaleDetail
	accepts_nested_attributes_for :saleDetails
	has_many :products, :autosave => true 
	accepts_nested_attributes_for :products
end
