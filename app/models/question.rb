class Question < ActiveRecord::Base
	belongs_to :form
	belongs_to :qtype

	has_many :answers
end
