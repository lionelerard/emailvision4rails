class HomeController < ApplicationController

	def index	
    render StandardNewsletter.daily_fr.to_html
	end

end