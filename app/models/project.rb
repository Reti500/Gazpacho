class Project < ActiveRecord::Base
	belongs_to :user

	has_many :forms

	validates_uniqueness_of :name
	validates_presence_of :name
end
