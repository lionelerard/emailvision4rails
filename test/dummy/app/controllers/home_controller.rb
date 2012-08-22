class HomeController < ApplicationController

	def index	
    render :file => 'standard_newsletter/daily_fr.html.emv', :layout => 'standard.html'		
	end

end