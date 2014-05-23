class AcadamicHistory < ActiveRecord::Base
	belongs_to :speaker_profile
	has_one :talk
end
