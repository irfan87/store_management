module ApplicationHelper
	def redirect_to_main_page
		if current_user
			customers_url
		else
			root_path
		end
	end
end
