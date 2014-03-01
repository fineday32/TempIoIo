class AdminController < ApplicationController
  def index
    
     @running_talks = Talk.where(:finished => nil)
     @talks = Talk.all
     
     
     @speakers = SpeakerProfile.all
     @speakers_working = SpeakerProfile.speakers_working
     @helpers = User.where(:role => "helper")
     @working_helpers = User.has_works_more_or_less_than(User.is_helper,"more",1)
     @helpers_too_much_work = User.has_works_more_or_less_than(User.is_helper,"more",5)
     @helpers_too_less_work = User.has_works_more_or_less_than(User.is_helper,"less",0)


     @comments = Comment.all
     @warnings = Comment.where.not(:rule_id => nil)
  end
end
