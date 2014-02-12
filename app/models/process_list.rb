class ProcessList < ActiveRecord::Base
	has_many :talk_process_lists 
	has_many :talks  ,:through =>:talk_process_lists
end
