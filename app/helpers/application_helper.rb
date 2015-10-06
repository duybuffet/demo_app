module ApplicationHelper
	def full_title(title)
		base_title = "Blog App"
		if title.strip == ""
			base_title
		else
			base_title + " | " + title 
		end
	end

	# Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
