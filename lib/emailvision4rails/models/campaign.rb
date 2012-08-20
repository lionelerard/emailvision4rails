class Emailvision4rails::Campaign < Emailvision4rails::Base
	
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

	validate :send_date_must_be_in_the_future, :message => "must be more than 5 minutes in the future"

	# Validate format of email address

	def initialize(payload)
		payload.each do |attr, val|
			send("#{attr}=", val) if attributes.has_key?(attr.to_s)
		end
	end

	def create
		if valid?
			run_callbacks :create do
				api.post.campaign.create(:body => {:campaign => self.to_emv}).call
			end
			true
		else
			false
		end
	end

	private

	def send_date_must_be_in_the_future
		# Adds 5 minutes to ensure futurness of send date between validation and publication
		send_date.present? ? (send_date > Time.now+5.minutes) : false
	end
end