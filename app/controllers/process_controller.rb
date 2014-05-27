class ProcessController < ApplicationController
  def index
  	@process_types = ProcessType.all
  	@processes = AllProcess.all
  end
end
