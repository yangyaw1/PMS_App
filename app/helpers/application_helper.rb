module ApplicationHelper
	include Rails.application.routes.url_helpers
	def full_title(page = '')
		base = "PMS_App"
		page.empty? ? base : page + " | " + base
	end
end
