class User < ActiveRecord::Base
  rolify
  authenticates_with_sorcery!

  has_many :projects
  has_many :forms
  has_many :answers
end
