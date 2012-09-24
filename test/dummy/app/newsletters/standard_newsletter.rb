class StandardNewsletter < Emailvision4rails::BaseController
	layout 'standard'

	def daily_fr
		@greetings = 'Hello'
		
		render
	end

end