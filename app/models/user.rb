class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :maintenance_items # Do I want #dependent: :destroy  here? I'd like for all of a users records to be deleted if they delete their profile. Does this just destroy the associated object, MaintenanceItem ? Or does it also destroy the objects associated to MaintenanceItem?
  
end
