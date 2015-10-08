class StaticPagesController < ApplicationController
  def home  	
  	if logged_in?
		@entry = current_user.entries.build 
		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def help
  	@feed_items = Entry.all.paginate(page: params[:page])
  end
end
