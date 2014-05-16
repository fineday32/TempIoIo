class SpeakersController < ApplicationController
  def index
    @speakerlist = SpeakerProfile.all
  end

  def new
  	# @speakers = SpeakerProfile.new 
    @new_speaker = SpeakerProfile.new 
    3.times do
      acadamic_histories = @new_speaker.acadamic_histories.build
    end      
  end

  def create
  	# @new_speaker = SpeakerCreator.new
    @new_speaker = SpeakerProfile.new(params.permit![:speaker_profile])
    @new_speaker.save!
    #@acadamic = Acadamic_histories.new(params.permit![:new_speaker][:acadamic_histories])
    #@acadamic.save!

  end

  def edit
    
  end

end
