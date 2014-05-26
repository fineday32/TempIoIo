class ProcessType < ActiveRecord::Base
	has_many :all_processes, :through => :process_lists
	has_many :process_lists
end
