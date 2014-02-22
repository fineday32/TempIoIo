class HelpersController < ApplicationController
      before_filter :authenticate_user!
  def index
      @talks = Talk.all

  end
  def new
      #@talk_creator = TalkCreator.new
      @process_lists = ProcessList.all 
      #10.times {@talk.talk_process_lists.build}
      

  end
  def create
      @talk_creator = TalkCreator.new(params.permit![:talk_content], current_user.id)
      @talk_creator.insert
      #flash[:notice] = @talk_creator.process_lists
      
      redirect_to new_helper_path

  end
  
  private
  def talks_params
      params.require(:talks).permit(:photography)
  end
  
      
end


