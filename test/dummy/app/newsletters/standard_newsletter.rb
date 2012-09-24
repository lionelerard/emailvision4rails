class StandardNewsletter < Emailvision4rails::BaseController
	layout 'standard'

	def daily_fr
		@greetings = 'Hello'
	end

end