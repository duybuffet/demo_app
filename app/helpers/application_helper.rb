module ApplicationHelper
	def full_title(title)
		base_title = "Blog App"
		if title.strip == ""
			base_title
		else
			base_title + " | " + title 
		end
	end
end
