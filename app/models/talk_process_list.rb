class TalkProcessList < ActiveRecord::Base
	belongs_to :all_process
	belongs_to :talk
end
