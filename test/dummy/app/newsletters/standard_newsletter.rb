class StandardNewsletter < Emailvision4rails::AbstractNewsletter
	layout 'standard'

	def daily_fr(params = {})
		newsletter(
			:message => default_message_params,
			:campaign => default_campaign_params.merge(:send_date => Time.now+1.day, :mailinglist_id => 123)
		)
	end

	private

	def default_message_params
		{
	    :name => 'My message',
	    :subject => 'Hello',
	    :from => 'Bastien Gysler', 
	    :from_email => 'basgys@gmail.com',
	    :reply_to => 'Bastien Gysler',
	    :reply_to_email => 'basgys@gmail.com',	
			:hotmail_unsub_flg => true,
      :is_bounceback => false,
      :encoding => 'UTF-8',
      :type => 'email'
		}
	end

	def default_campaign_params
		{
			:name => 'My Campaign',
			:analytics => true
		}
	end

end