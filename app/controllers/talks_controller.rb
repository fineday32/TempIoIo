class TalksController < ApplicationController
  def index

  end

  def edit
  	@t = TalkCreator.new
  	@talk_content = @t.talk_load_one(Talk.find(params[:id]))
  	@usercomments = Comment.get_by_owner(Talk.find(params[:id]))
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
  	@process_list = ProcessList.pluck(:title).uniq
  	if (@get_type == "all")
  	@tc_list= @tc.talk_load(Talk.all)
    elsif (@get_type == "working")
  	@tc_list = @tc.talk_load(Talk.not_finished)
  	else
    @tc_list = @tc.talk_load(Talk.on_process(@get_type))
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