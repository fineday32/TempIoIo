class ProcessList < ActiveRecord::Base
	belongs_to :all_process
	belongs_to :process_type
	
end
