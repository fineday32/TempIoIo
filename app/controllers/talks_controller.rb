class TalksController < ApplicationController
  before_filter :authenticate_user!
  def index

  end
  def new
      @process_lists = ProcessList.all
      @acadamic_histories = AcadamicHistory.find(params[:id]) 
      @talk = Talk.new
      user_talks = @talk.user_talks.build
       
  end
  def create
      @talk = Talk.new(params.permit![:talk])
      @talk.save!
      ProcessType.where(:title=>params[:talk][:process_types])[0].all_processes.each do |p|
        TalkProcessList.create(:talk_id => @talk.id, :all_process_id => p.id)
      end
      if(params[:talk][:helper])
        UserTalk.create(:talk_id => @talk.id, :user_id =>  params[:talk][:helper])
      end
      #redirect_to talk_path
      redirect_to talks_path
      #@talk_creator = TalkCreator.new
      #@talk_creator.insert(params.permit![:talk_content], current_user)
  end
  def edit
  	@process_lists = ProcessList.all 
    @t = TalkCreator.new
  	@talk_content = @t.talk_load_one(Talk.find(params[:id]))
  	@allusercomments = Comment.get_by_talk(Talk.find(params[:id]))
    #@comment_content = Comment.add_new_comment(:comments)
    @comment = Comment.new
    @acadamic_histories = AcadamicHistory.find(params[:id]) 
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  def type
  	@tc = TalkCreator.new
  	@get_type = params[:type].gsub(/_/, " ") 
    @get_type = @get_type.gsub(/:/, "") 
  	@process_list = ProcessList.pluck(:title).uniq
    if current_user.admin?
      @Talks= Talk.all
    else
      @Talks = current_user.talks
    end
  	if (@get_type == "all")
  	@tc_list= @tc.talk_load(@Talks)
    elsif (@get_type == "working")
  	@tc_list = @tc.talk_load(@Talks.not_finished)
  	else
    @tc_list = @tc.talk_load(@Talks.on_process(@get_type))
  	end
  	
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
  def update
  	@t = TalkCreator.new
  	@talk_content = @t.update(params.permit![:talk_content])
    
  	redirect_to "/talks:all"

  end
  def download
    @file_object = Talk.find(params[:id])
    redirect_to(@file_object.bg.expiring_url(10))
  end
  def commenting
    @commenting = Comment.new
    @talk = params[:id]
    @category = params[:category]
                        
    respond_to do |format|
      format.html
      format.js
    end
  end
end