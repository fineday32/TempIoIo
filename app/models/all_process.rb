class AllProcess < ActiveRecord::Base
	has_many :talks, :through => :talk_process_lists
    has_many :process_types, :through => :process_lists
    has_many :process_lists 
    has_many :talk_process_lists	
end
