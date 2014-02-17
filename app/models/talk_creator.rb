class TalkCreator 
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :user_id, :bio, :eng_name, :chi_name, :title, :photography

    @user_id
    @bio
    @eng_name
    @chi_name
    @title
    @photography
    

  def initialize(attributes = {}, id)
  	attributes.each { |key, value| send "#{key}=", value }
  	@user_id = id
  end

    def self.eng_name
   	@eng_name
	end

 	def self.chi_name
    @chi_name
 	end

 	def self.bio
    @bio
 	end

 	def self.title
 		@title
 	end

 	def self.user_id
        @user_id = current_user.user_id
    end
    def self.photography
    	@photography
    end
   def insert
   		speaker = SpeakerProfile.new
   		speaker.user_id = self.user_id
   		speaker.bio = self.bio
   		talk = Talk.new
   		talk.title = self.title
   		talk.photography = self.photography
   		talk.save!
   		speaker.save!
   end
end
