class User < ActiveRecord::Base
  rolify
  authenticates_with_sorcery!
end
