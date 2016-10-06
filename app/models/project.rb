class Project < ActiveRecord::Base

	has_many :bugs
	has_many :upbridges
	has_many :users, through: :upbridges
	validates :title, presence: true,uniqueness: true, length:{minimum: 3 , maximum: 25}
	validates :des,presence: true, length:{minimum: 3 , maximum: 100}

end
