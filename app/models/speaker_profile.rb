class SpeakerProfile < ActiveRecord::Base
	has_many :acadamic_histories
    has_many :talks

    def self.speakers_working
    	speaker_list = Array.new
    	SpeakerProfile.all.each do |s|
			if (s.talks.where(:finished=>nil).count >0)
				speaker_list << s
			end
		end
		speaker_list
    end
end
