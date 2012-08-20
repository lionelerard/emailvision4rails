class StandardNewsletter < Emailvision4rails::AbstractNewsletter
	layout 'standard'

	def daily_fr(params = {})
		puts "Daily FR ! #{params.inspect}"
		newsletter(
			:message => default_message_params,
			:campaign => default_campaign_params.merge(:send_date => Time.now+1.day, :mailinglist_id => 24486)
		)
	end

	private

	def default_message_params
		{
			:name => 'Daily FR',
			:subject => 'Test daily FR',
			:from => 'etravel.ch', 
			:from_email => 'mail@nl.etravel.ch',
			:reply_to => 'etravel.ch', 
			:reply_to_email => 'noreply@etravel.ch',
			:hotmail_unsub_flg => true,
      :is_bounceback => false,
      :encoding => 'UTF-8',
      :type => 'email'
		}
	end

	def default_campaign_params
		{
			:name => 'Campaign Daily FR',
			:analytics => true
		}
	end

end