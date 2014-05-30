class SpeakersController < ApplicationController
  def index
    @speakerlist = SpeakerProfile.all
  end

  def new
  	# @speakers = SpeakerProfile.new 
    @new_speaker = SpeakerProfile.new
    @area = ["North America", "South America", "Asia", "Europe", "Africa", "Oceania"]
    # @subregion = :region
    # @subregion = Country.find_country_by_name(params[:nation])
    # @region = Country.find_country_by_name(:nation)
    @studies = ["Arts & Design","Business & Management", "Media & Communication", "Education", "Engineering", "Humanities & Social Science", "Law", "MBA/EMBA", "Medical & Public Health", "Science", "Other"]
    @achievement = ["Postdoc","PhD","MSc","BSc"]
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
    @area = ["North America", "South America", "Asia", "Europe", "Africa", "Oceania"]
        # @subregion = :region
    # @subregion = Country.find_country_by_name(:nation)


    @studies = ["Arts & Design","Business & Management", "Media & Communication", "Education", "Engineering", "Humanities & Social Science", "Law", "MBA/EMBA", "Medical & Public Health", "Science", "Other"]
    if i < 4
      (3-i).times do
        acadamic_histories = @speaker.acadamic_histories.build
        # acadamic_histories.region = Country.find_country_by_name(@speaker.acadamic_histories.nation.to_s).continent
      end
    end
  end

  def update
    @speaker = SpeakerProfile.find(params[:id])
    @speaker.update_attributes(params.permit![:speaker_profile])
    redirect_to speakers_path
  end
  def show
  end

end
