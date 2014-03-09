class SpeakersController < ApplicationController
  def index

  end

  def new
  	@new_speaker= SpeakerCreator.new
  end
  def create
  	
  end

end
