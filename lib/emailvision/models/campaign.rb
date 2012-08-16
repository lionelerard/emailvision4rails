class Emailvision::Campaign < Emailvision::Base

	attributes(
		:name,
		:mailinglist_id,
		:message_id, 
		:send_date,
		:description,
		:emaildedupflg, 
		:format, 
		:delivery_speed, 
		:notification,
		:post_click_tracking,
		:strategy,
		:target,
		:url_end_campaign,
		:url_host,
		:analytics  		    
	)

	validates_presence_of(
		:name,
		:mailinglist_id,
		:message_id, 
		:send_date
	)

	validate :send_date_must_be_in_the_future. :message => "must be more than 5 minutes in the future"

	# Validate format of email address

	def create
		valid? ? api.post.campaign.create(:body => self.to_emv).call : false
	end

	private

	def send_date_must_be_in_the_future
		send_date > Date.now+5.minutes # Adds 5 minutes to ensure futurness of send date between validation and publication
	end

end