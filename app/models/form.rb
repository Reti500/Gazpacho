class Form < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	has_many :questions
	has_many :information
end
