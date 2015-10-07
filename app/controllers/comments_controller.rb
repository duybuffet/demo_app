class CommentsController < ApplicationController
	before_action :logged_in_user, only: :create
	def create
		entry = Entry.find(params[:entry_id])
		if !entry.nil?
			comment = entry.comments.build(content: params[:comment][:content])
			comment.user_id = current_user.id
			if comment.save
				flash[:success] = "Commented!"  
				redirect_to entry
			else
				flash[:danger] = "Error!"  
				redirect_to entry
			end
		else
			redirect_to root_url
		end
	end
end
