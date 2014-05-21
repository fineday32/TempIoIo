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
    @speaker = SpeakerProfile.find(params[:id])
    i = @speaker.acadamic_histories.count
    if i < 4
      (3-i).times do
        acadamic_histories = @speaker.acadamic_histories.build
      end
    end
  end

  def update
  
  end

end
