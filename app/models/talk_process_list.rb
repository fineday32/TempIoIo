class TalkProcessList < ActiveRecord::Base
	belongs_to :process_list
	belongs_to :talk
end
