class TalkProcessList < ActiveRecord::Base
	belongs_to :all_processes
	belongs_to :talk
end
