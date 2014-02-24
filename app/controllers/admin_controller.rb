class AdminController < ApplicationController
  def index
     @comments = Comment.all
     @warnings = Comment.where.not(:rule_id => nil)
     @running_talks = Talk.where(:finished => nil)
     @talks = Talk.all
     @helpers = User.where(:role => "helepr")
     @working_helpers = 0
     @speakers = SpeakerProfile.all
     @working_speakers = 0;
  end
end
