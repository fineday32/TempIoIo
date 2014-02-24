class TalkCreator 
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :user_id, 
                :comment,
                :bio, :eng_name, :chi_name, :existing,
                :school1 , :department1,:year1,:degree1,:nation1,:school2,:department2,:year2,:degree2,:nation2,:school3,:department3,:year3,:degree3,:nation3, :chosen_degree,
                :check_acadamic1, :check_acadamic2, :check_acadamic3, 
                :photo, :title, :photography, 
                :title,:intro,:bg,:poster,:slide1,:slide2,:slide3,:videourl1,:videourl2,:videourl3,:videocomment1,:videocomment2,:videocomment3,:feedback1,:feedback2,:feedback3,:signup,:photography,
                :process_lists,:process,:date_array, :check_array, :name_array
#helper     
    @user_id

#comement
    @comment

#speaker profile
    @bio
    @eng_name
    @chi_name
    @existing

#acadamic histories
    @school1
    @department1
    @year1
    @degree1
    @nation1
    @school2
    @department2
    @year2
    @degree2
    @nation2
    @school3
    @department3
    @year3
    @degree3
    @nation3
    @check_acadamic1
    @check_acadamic2
    @check_acadamic3
#talks
    @title
    @intro
    @bg
    @poster
    @slide1
    @slide2
    @slide3
    @videourl1
    @videourl2
    @videourl3
    @videocomment1
    @videocomment2
    @videocomment3
    @feedback1
    @feedback2
    @feedback3
    @signup
    @photography
#process list
    @process_lists
    @process
    @date_array
    @check_array
    @name_array

  def initialize(attributes = {}, id)
  	attributes.each { |key, value| send "#{key}=", value }
  	@user_id = id
  end
#helper
  def self.user_id
    @user_id = current_user.user_id
  end
#comment
  def self.comment
    @comment
  end
#speaker profile
  def self.bio
    @bio
  end

  def self.eng_name
   	@eng_name
	end

 	def self.chi_name
    @chi_name
 	end

#academic history
 	def self.school1
 		@school1
 	end
  def self.department1
    @department1
  end
  def self.year1
    @year1
  end
  def self.degree1
    @degree1
  end
  def self.nation1
    @nation1
  end
  def self.school2
    @school2
  end
  def self.department2
    @department2
  end
  def self.year2
    @year2
  end
  def self.degree2
    @degree2
  end
  def self.nation2
    @nation2
  end
    def self.school3
    @school3
  end
  def self.department3
    @department3
  end
  def self.year3
    @year3
  end
  def self.degree3
    @degree3
  end
  def self.nation3
    @nation3
  end

  #talk 
  def self.title
    @title
  end
   def self.intro
    @intro
  end
  def self.bg
    @bg
  end
  def self.poster
    @poster
  end
  def self.slide1
    @slide1
  end
  def self.slide2
    @slide2
  end
  def self.slide3
    @slide3
  end
  def self.videourl1
    @videourl1
  end
  def self.videourl2
    @videourl2
  end
  def self.videourl3
    @videourl3
  end
  def self.videocomment1
    @videocomment1
  end
  def self.videocomment2
    @videocomment2
  end
  def self.videocomment3
    @videocomment3
  end
  def self.feedback1
    @feedback1
  end
  def self.feedback2
    @feedback2
  end
  def self.feedback3
    @feedback3
  end
  def self.signup
    @signup
  end
  def self.photography
    @photography
  end
   #process list
  def self.process_lists
    @process_lists 
  end
  def self.date_array
    @date_array 
  end
  def self.check_array
    @check_array
  end
  def self.check_acadamic1
    @check_acadamic1
  end
  def self.check_acadamic2
    @check_acadamic2
  end
  def self.check_acadamic3
    @check_acadamic3
  end
  def insert
    #speaker
    speaker = SpeakerProfile.new
   	if(@bio)
      speaker.bio = self.bio
    end
     if(@eng_name)
        speaker.eng_name = @eng_name
      end
      if(@chi_name)
        speaker.chi_name = @chi_name
      end
      speaker.save!
    talk = Talk.new
    #acadamic histories
     if(@school1.length>0 && @department1.length>0 && @nation1.length>0 && @year1.length>0 && @degree1.length>0)
       if (check_acadamic1=="true")
        talk.degree_id = "1";
      end
     end
     if(@school2.length>0 && @department2.length>0 && @nation2.length>0 && @year2.length>0 && @degree2.length>0)
       if(check_acadamic2=="true")
          talk.degree_id = "2";
      end
     end
      if(@school3.length>0 && @department3.length>0 && @nation3.length>0 && @year3.length>0 && @degree3.length>0)
       if(check_acadamic3=="true")
          talk.degree_id = "3";
      end
     end
      
    #talk
      
      if(@intro)
   		 talk.intro = @intro
      end
      if(@bg)
        talk.bg = @bg
      end
      if(@poster)
        talk.poster = @poster
      end
      if(@slide1)
        talk.slide1 = @slide1
      end
      if(@slide2)
        talk.slide2 = @slide2
      end
      if(@slide3)
        talk.slide3 = @slide3
      end
      if(@videourl1)
        talk.videourl1 = @videourl1
      end
      if(@videourl2)
        talk.videourl2  = @videourl2
      end
      if(@videourl3)
        talk.videourl3 = @videourl3
      end
      if(@videocomment1)
        talk.videocomment1 = @videocomment1
      end
      if(@videocomment2)
        talk.videocomment2 = @videocomment2
      end
      if(@videocomment3)
        talk.videocomment3 = @videocomment3
      end
      if(@feedback1)
        talk.feedback1 = @feedback1
      end
      if(@feedback2)
        talk.feedback2 = @feedback2
      end
      if(@feedback3)
        talk.feedback3 = @feedback3
      end
      
      
      if(@photography)
        talk.photography = @photography
      end
     

      
      talk.speaker_profile_id= speaker.id
      talk.save!
   		 
      create_process(@date_array, @check_array, @name_array, talk)
      create_user_talk(user_id, talk)
      create_comment(@comment, talk)
  end
  def create_acadamic_history(school, department, nation, year, degree, speaker, check)
       acadamic_history = AcadamicHistory.new
       acadamic_history.speaker_profile_id = speaker.id
       acadamic_history.school  = school
       acadamic_history.department = department
       acadamic_history.nation  = nation
       acadamic_history.year  = year
       acadamic_history.degree  = degree
       acadamic_history.save!
  end
  def create_speaker(bio, user_id)
      
  end
 
  def create_user_talk(user_id, talk)
      usertalk = UserTalk.new
      usertalk.user_id= user_id
      usertalk.talk_id = talk.id
      usertalk.save!
  end
  def create_process(date_array,check_array, name_array, talk)
      name = name_array.split(",");
      check = check_array.split(",");
      date = date_array.split(",");
      
      i=0;
      until i== name.length
        talk_process_list = TalkProcessList.new
        talk_process_list.talk_id = talk.id
        talk_process_list.sequence = i+1;
        talk_process_list.process_name=  name[i];
        if check[i]=="true"
          talk_process_list.finished_date = date[i];
        end
        talk_process_list.save!;
        i+=1;
      end
  end
  def create_comment(content, talk)
      comment = Comment.new
      comment.content = content
      comment.talk_id = talk.id
      comment.type = "comment"
      comment.save!

      talk.user_talks.each do |ut|
        user_comment = Usercomment.new  
        user_comment.user_id = ut.user_id
        user_comment.comment_id = comment.id
        user_comment.save!
      end

  end
end
