module ApplicationHelper
	def full_title(page = '')
		base = "PMS_App"
		page.empty? ? base : page + " | " + base
	end
end
