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
      redirect_to talks_path
  end

  def edit
  	@process_lists = ProcessList.all 
    @talk = Talk.find(params[:id])
  	@allusercomments = Comment.get_by_talk(Talk.find(params[:id]))
    #@comment_content = Comment.add_new_comment(:comments)
    @comment = Comment.new
    
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def type
  	@tc = TalkCreator.new
  	@get_type = params[:type].gsub(/_/, " ") 
    @get_type = @get_type.gsub(/:/, "") 
  	@process_list = AllProcess.all.pluck(:title)
    if current_user.admin?
      @Talks= Talk.all
    else
      @Talks = current_user.talks
    end
  	if (@get_type == "all")
  	@tc_list= Talk.all

   #  elsif (@get_type == "working")
  	# @tc_list = @tc.talk_load(@Talks.not_finished)
  	# else
   #  @tc_list = @tc.talk_load(@Talks.on_process(@get_type))
  	end
  	
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
  def update
  	@talk = Talk.find(params[:id])
    @talk.update_attributes(params.permit![:talk])
    @talk.save!
    @talk.update_process(params[:talk][:processes])
  	@talk.update_user(params[:talk][:id])
    
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