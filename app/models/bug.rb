class Bug < ActiveRecord::Base

	belongs_to :project
	belongs_to :user
	validates :title, presence: true,
					  uniqueness: true
	validates :ty, presence: true
	validates :status, presence: true

end
