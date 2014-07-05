class GoalSale < ActiveRecord::Base
	belongs_to :user, :foreign_key => :usuario_id
end
