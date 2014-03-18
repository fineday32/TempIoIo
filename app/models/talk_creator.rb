class TalkCreator 
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
    


  attr_accessor :users_array, :user_id, :users,
                :comment,
                :bio, :eng_name, :chi_name, :existing, :speaker_id,
                :school1 , :department1,:year1,:degree1,:nation1,:school2,:department2,:year2,:degree2,:nation2,:school3,:department3,:year3,:degree3,:nation3, :chosen_degree,
                :check_acadamic1, :check_acadamic2, :check_acadamic3, 
                :photo, :title, :photography, 
                :title,:intro,:bg,:poster,:slide1,:slide2,:slide3,:videourl1,:videourl2,:videourl3,:videocomment1,:videocomment2,:videocomment3,:feedback1,:feedback2,:feedback3,:signup,:photography, :finished,
                :process_lists,:process,:date_array, :check_array, :name_array, :name, :date, :check,
                :main, :talk_id

  
  def insert(attributes = {}, current_user)

    attributes.each { |key, value| send "#{key}=", value }
  
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
    
     if(@school1.length>0 && @department1.length>0 && @nation1.length>0 && @year1.length>0 && @degree1.length>0)
       acadamicHistory = create_acadamic_history(@school1, @department1, @nation1, @year1, @degree1, speaker)
       if (check_acadamic1=="true")
          talk.degree_id =acadamicHistory.id
        
      end
     end
     if(@school2.length>0 && @department2.length>0 && @nation2.length>0 && @year2.length>0 && @degree2.length>0)
       acadamicHistory= create_acadamic_history(@school2, @department2, @nation2, @year2, @degree2, speaker)      
       if(check_acadamic2=="true")
         talk.degree_id = acadamicHistory.id
       end
     end
      if(@school3.length>0 && @department3.length>0 && @nation3.length>0 && @year3.length>0 && @degree3.length>0)
       acadamicHistory = create_acadamic_history(@school3, @department3, @nation3, @year3, @degree3, speaker)
       if(check_acadamic3=="true")
          talk.degree_id = acadamicHistory.id
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
      create_user_talk(@users_array, talk)
      create_comment(@comment, talk, current_user)
  end
  def create_acadamic_history(school, department, nation, year, degree, speaker)
       acadamic_history = AcadamicHistory.new
       acadamic_history.speaker_profile_id = speaker.id
       acadamic_history.school  = school
       acadamic_history.department = department
       acadamic_history.nation  = nation
       acadamic_history.year  = year
       acadamic_history.degree  = degree
       acadamic_history.save!
       acadamic_history
  
  end
 
  def create_user_talk(users_array, talk)
      users = users_array.split(",");
      i=0;
      until i== users.length
        usertalk = UserTalk.new
        usertalk.user_id= users[i]
        usertalk.talk_id = talk.id
        usertalk.save!
        i+=1;
      end
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
          talk_process_list.finished = true
        end
        talk_process_list.save!;
        i+=1;
      end
  end
 def load_process(talk)
      processes = talk.talk_process_lists
      name = Array.new(processes.length)
      date = Array.new(processes.length)
      check = Array.new(processes.length)

      processes.each do |p| 
       name[p.sequence-1] = p.process_name
        if(p.finished)            
          check[p.sequence-1] = "true"
        end
      end
  end


  def create_comment(content, talk, current_user)
      comment = Comment.new
      comment.content = content
      comment.talk_id = talk.id
      comment.comment_type = "comment"
      comment.save!

      talk.user_talks.each do |ut|
        user_comment = Usercomment.new  
        user_comment.user_id = ut.user_id
        user_comment.comment_id = comment.id
        if( current_user.id == ut.user_id)
          user_comment.role ="owner"
        else
          user_comment.status ="unread"
        end

        user_comment.save!
      end

  end
  
  
  def sign_up_date
     begin
        @process.order("sequence").first.finished_date
      rescue
        puts "-"
      end
  end

  def last_activity_date
      begin 
        @process.where.not(:finished => nil).order("sequence").last.finished_date
      rescue
        puts "-"
      end
  end

  def days_since_sign_up
      begin
        if(!@finished)
          days =(Date.today - @process.order("sequence").first.finished_date).to_i 
        else
        days= "-"
        end
      rescue
        days= "-"
      end
  end


  def days_since_last_activity
      begin
        if(!@finished)
          days = (Date.today - @process.where.not(:finished => nil).order("sequence").last.finished_date).to_i
        else
           days="-"
          end
      rescue
        days =  "-"
      end
  end

  def helpers
      @users.name
  end

  def status
    begin
      @content = process.where(:finished=>nil).order("sequence").first.process_name
    rescue
      @content =  "Finished"
    end
  end
 

def talk_load_one(t)
      tc = TalkCreator.new
      tc.bio = t.speaker_profile.bio
      tc.eng_name = t.speaker_profile.eng_name
      tc.chi_name = t.speaker_profile.chi_name
      
      
      tc.school1 = t.speaker_profile.acadamic_histories[0].school
      tc.department1 = t.speaker_profile.acadamic_histories[0].department
      tc.year1 = t.speaker_profile.acadamic_histories[0].year
      tc.degree1 = t.speaker_profile.acadamic_histories[0].degree
      tc.nation1 = t.speaker_profile.acadamic_histories[0].nation
      if( t.speaker_profile.acadamic_histories[0].id ==  t.degree_id) 
          tc.check_acadamic1 = true
      end
      if (t.speaker_profile.acadamic_histories.count>1)
        tc.school2 = t.speaker_profile.acadamic_histories[1].school
        tc.department2 = t.speaker_profile.acadamic_histories[1].department
        tc.year2 = t.speaker_profile.acadamic_histories[1].year
        tc.degree2 = t.speaker_profile.acadamic_histories[1].degree
        tc.nation2 = t.speaker_profile.acadamic_histories[1].nation
        if(t.speaker_profile.acadamic_histories[1].id ==  t.degree_id) 
          tc.check_acadamic2 = true
        end
      end
      if (t.speaker_profile.acadamic_histories.count>2)
        tc.school3 = t.speaker_profile.acadamic_histories[2].school
        tc.department3 = t.speaker_profile.acadamic_histories[2].department
        tc.year3 = t.speaker_profile.acadamic_histories[2].year
        tc.degree3 = t.speaker_profile.acadamic_histories[2].degree
        tc.nation3 = t.speaker_profile.acadamic_histories[2].nation
        if(t.speaker_profile.acadamic_histories[2].id ==  t.degree_id) 
          tc.check_acadamic3 = true
        end
      end

      tc.main = t.speaker_profile.acadamic_histories.find(t.degree_id)

      tc.intro = t.intro
      tc.bg = t.bg
      tc.poster = t.poster
      tc.slide1 = t.slide1
      tc.slide2 = t.slide2
      tc.slide3 = t.slide3
      tc.videourl1 = t.videourl1
      tc.videourl2 = t.videourl2
      tc.videourl3 = t.videourl3
      tc.videocomment1 = t.videocomment1
      tc.videocomment2 = t.videocomment2
      tc.videocomment3 = t.videocomment3
      tc.feedback1 = t.feedback1
      tc.feedback2 = t.feedback2
      tc.feedback3 = t.feedback3
      tc.photography = t.photography
      tc.process = t.talk_process_lists
      tc.users = t.users[0].name
      tc.finished = t.finished
      tc.talk_id = t.id
      tc.comment = t.comments.all
      tc.speaker_id = t.speaker_profile.id

      tc
end

def talk_load(talks)
    tc_list = Array.new

    talks.each do |t|
      tc = TalkCreator.new
      tc = talk_load_one(t)
      tc_list << tc
    end
    tc_list
end

def update(attributes = {})

    attributes.each { |key, value| send "#{key}=", value }
  
    #speaker
    speaker = SpeakerProfile.find(@speaker_id)
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
    talk = Talk.find(@talk_id)
    #acadamic histories
    if(@school1.length>0 && @department1.length>0 && @nation1.length>0 && @year1.length>0 && @degree1.length>0)
       acadamicHistory = create_acadamic_history(@school1, @department1, @nation1, @year1, @degree1, speaker)
      if (check_acadamic1=="true")
          talk.degree_id =acadamicHistory.id
      end
    end
    if(@school2.length>0 && @department2.length>0 && @nation2.length>0 && @year2.length>0 && @degree2.length>0)
       acadamicHistory= create_acadamic_history(@school2, @department2, @nation2, @year2, @degree2, speaker)      
       if(check_acadamic2=="true")
         talk.degree_id = acadamicHistory.id
       end
    end
    if(@school3.length>0 && @department3.length>0 && @nation3.length>0 && @year3.length>0 && @degree3.length>0)
       acadamicHistory = create_acadamic_history(@school3, @department3, @nation3, @year3, @degree3, speaker)
      if(check_acadamic3=="true")
          talk.degree_id = acadamicHistory.id
      end
    end
    
  #talk
    
    if(@intro)
     talk.intro = @intro
    end
    if(@bg != talk.bg)
      talk.bg = @bg
    end
    if(@poster != talk.poster)
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
    
    
    talk.talk_process_lists.delete_all
    create_process(@date_array, @check_array, @name_array, talk)
    talk.save!;
    talk = Talk.find(@talk_id)
    talk.finished =  
     (talk.talk_process_lists.count>0 && talk.talk_process_lists.where(:finished=>nil).count==0)
    talk.save!;
    #create_user_talk(@users_array, talk)
      #create_comment(@comment, talk)
  end
  def persisted?
    false
  end
end
