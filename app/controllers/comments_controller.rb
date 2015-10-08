class CommentsController < ApplicationController
	before_action :logged_in_user, only: :create
	before_action :follow_or_owner, only: :create
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

	private 
		def follow_or_owner
			entry = Entry.find(params[:entry_id])
			if entry.user != current_user && !current_user.following?(entry.user)
				flash[:danger] = "You can not comment on this entry."
        		redirect_to root_url
			end
		end
end
