class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[selectrole admin guest]
  before_save :role_create
  def s_roles=(roles)
    self.roles = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def role_create
puts "sssssssssssssssssssssssssssssssssssssssssssss",self.roles
	self.roles = self.roles	
  end	

  def a_roles
    ROLES.reject do |r|
      ((roles.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end
  def is?(role)
    roles.include?(role.to_s)
  end
end
