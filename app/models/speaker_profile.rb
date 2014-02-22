class SpeakerProfile < ActiveRecord::Base
	has_many :acadamic_histories
    has_many :talks

end
