class HelpersController < ApplicationController
      before_filter :authenticate_user!
  def index
      @talks = Talk.all
      respond_to do |format|
        format.html
        format.js
      end
  end
  def new
      #@talk_creator = TalkCreator.new
      @process_lists = ProcessList.all 
      #10.times {@talk.talk_process_lists.build}
      

  end
  def create
      @talk_creator = TalkCreator.new
      @talk_creator.insert(params.permit![:talk_content], current_user)
      #flash[:notice] = @talk_creator.process_lists
      
      redirect_to new_helper_path

  end
  def update

  end
  def show
    @tc = TalkCreator.new
    @tc_list= @tc.talk_load(Talk.find(params[:id]))
  end
  private
  def talks_params
      params.require(:talks).permit(:photography)
  end
  
      
end


