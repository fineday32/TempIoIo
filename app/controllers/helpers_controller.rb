class HelpersController < ApplicationController
      before_filter :authenticate_user!
  def index
      @talks = Talk.all
  end
  def new
      @talk = Talk.new

  end
  def create
      @talk_creator = TalkCreator.new(params.permit![:talk_content], current_user.id)
      @talk_creator.insert
      flash[:notice] = @talk_creator.user_id
       render :action => 'new'

  end
  
  private
  def talks_params
      params.require(:talks).permit(:photography)
  end
  
      
end
