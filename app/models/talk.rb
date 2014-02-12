class Talk < ActiveRecord::Base
	has_many :usertalks
	has_many :users , :through => :usertalks
end
