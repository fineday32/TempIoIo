class ProcessController < ApplicationController
  def index
  	@process_types = ProcessType.all
  	@processes = AllProcess.all
  end
  def create
    ProcessForm.save(params[:process_form][:processes],params[:process_form][:process_list])
    redirect_to process_index_path
  end
end
