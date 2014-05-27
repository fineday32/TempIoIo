class HomeController < ApplicationController
	before_filter :authenticate_user!
  def index
    
    @tc_list= Talk.all

 	
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
  def talk
  end
end
