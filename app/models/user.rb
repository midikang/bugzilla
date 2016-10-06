class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthables
  has_many :bugs
  has_many :upbridges
  has_many :projects, through: :upbridges
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,presence: true,
					uniqueness:{case_sensitive:false},
					length:{minimum: 3,maximum:25}					 
  validates :role,presence: true
end
