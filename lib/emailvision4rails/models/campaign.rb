class Emailvision4rails::Campaign < Emailvision4rails::Base
	
	attributes(
		:id,
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

	validates_numericality_of(
		:mailinglist_id,
		:message_id
	)

	validate do
		if send_date.blank? or (send_date < Time.now+5.minutes)
			errors.add(:send_date, "must be more than 5 minutes in the future")
		end
	end	

	def initialize(payload = {})
		payload.each do |attr, val|
			send("#{attr}=", val) if attributes.has_key?(attr.to_s)
		end
	end

	def post
		api.get.campaign.post(uri: [id]).call
	end

	def unpost
		api.get.campaign.unpost(uri: [id]).call
	end

	def create
		if valid?
			run_callbacks :create do
				self.id = api.post.campaign.create(:body => {:campaign => self.to_emv}).call
			end
			true
		else
			false
		end
	end

	def destroy
		run_callbacks :destroy do
			self.id = api.get.campaign.delete(:uri => [self.id]).call
		end
		true
	end
end