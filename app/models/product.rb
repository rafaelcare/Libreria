class Product < ActiveRecord::Base
	has_many :saleDetails
	has_many :orderDetails
	belongs_to :category
	has_many :users
	#has_many :orders, :through => :users
	 #attr_accessible :nombre, :precio, :released_on
  
    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
      csv << column_names
        all.each do |product|
          csv << product.attributes.values_at(*column_names)
        end
      end
    end
end
