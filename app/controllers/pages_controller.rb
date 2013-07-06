class PagesController < ApplicationController
	
  def new
  	render :file => "app/views/pages/new.html.erb"
  end
end
