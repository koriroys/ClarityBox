class HeadquartersController < ApplicationController

  layout "headquarters"

  def index
    @work_request = WorkRequest.new
  end

  def story
  end

  def philosophy
  end


end
