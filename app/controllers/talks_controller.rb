class TalksController < ApplicationController
  def index

  end

  def show
  	@tc = TalkCreator.new
  	@tc_list= @tc.talk_load(Talk.all)
  end
  def type
  	@tc = TalkCreator.new
  	@get_type = params[:type]
  	
  	if (@get_type == ":all")
  	@tc_list= @tc.talk_load(Talk.all)
  	end
  	else if (@get_type == ":working")
  	@tc_list = @tc.talk_load(Talk.not_finished)
  	
  	end
  	
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
end