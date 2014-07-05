class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :orders,:through => :products
  belongs_to :sale
  belongs_to :goal_sale
  ROLES = %w[Administrador Vendedor]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   #validates :username, :uniqueness => true#, :length => { :in => 3..20 }  
  #attr_accessor :direccion, :telefono, :password, :password_confirmation, :remember_me
  #attr_accessor :password
  
end
